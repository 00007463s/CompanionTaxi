//
//  ListViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import FirebaseDatabase


struct Drivers: Codable {
    let fromDate: String
    let toDate: String
    let fromPlace: String
    let toPlace: String
    let when: String
    let name: String
    let price: String
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let backButton = UIButton()
    let searchView = UIView()
    var searchTextField = UITextField()
    var codeSegmented: CustomSegmentedControl!
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    var drivers = [Drivers]()
    var cheapestDrivers = [Drivers]()
    var closestDrivers = [Drivers]()
    var tomorrowDrivers = [Drivers]()



    
    var fromPlace : Address!
    var toPlace: Address!
    var date = ""
    var personCount = ""

    var ref: DatabaseReference!

    
    init(fromPlace: Address, toPlace: Address, date: String, personCount: String){
        super.init(nibName: nil, bundle: nil)
        self.fromPlace = fromPlace
        self.toPlace = toPlace
        self.date = date
        self.personCount = personCount
        
        ref = Database.database().reference()

        ref.child("drivers").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
            _ = snapshot.value as? String ?? "Unknown"
            //let rewards = try JSONDecoder().decode([Reward].self, from: snapshot.listToJSON)
            self.getData(snapshot: snapshot)
        })
    }
    
    func getData(snapshot: DataSnapshot){

        self.drivers = try! JSONDecoder().decode([Drivers].self, from: snapshot.listToJSON)
        print(self.drivers)
        
        self.drivers = self.drivers.filter { $0.fromPlace == self.fromPlace.city && $0.toPlace == self.toPlace.city
        }
        
        self.closestDrivers = self.drivers.filter { $0.when == "Today" }
        self.tomorrowDrivers = self.drivers.filter { $0.when == "Tomorrow" }
        
        self.makeUI()
        self.tableView.reloadData()
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    func makeUI(){
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
            make.top.equalTo(backButton.snp.bottom).offset(3)
        }
        
        searchView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.top.bottom.equalToSuperview()
        }
        
        searchTextField.backgroundColor = .systemGray6
        searchTextField.layer.cornerRadius = 20
        
        let allDrivers = String(self.drivers.count)
        codeSegmented = CustomSegmentedControl(frame: CGRect(x: 0, y: 106 + UIApplication.shared.statusBarFrame.size.height, width: self.view.frame.width, height: 60), buttonTitle: ["All","Cheapest","Closest"], buttonCounts: [allDrivers, "1" , String(self.closestDrivers.count)])
        codeSegmented.backgroundColor = .clear
        codeSegmented.delegate = self
        view.addSubview(codeSegmented)
        
        backButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(codeSegmented.snp.bottom).offset(2)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.register(ListCell.self, forCellReuseIdentifier: "ListCell")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if self.closestDrivers.count > 0 && self.tomorrowDrivers.count > 0 && self.codeSegmented.selectedIndex == 0{
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch codeSegmented.selectedIndex {
        case 0:
            if self.closestDrivers.count > 0 && self.tomorrowDrivers.count > 0 {
                if section == 0 {
                    return self.closestDrivers.count
                }else{
                    return self.tomorrowDrivers.count
                }
            }
        
           return self.drivers.count
        case 1:
          return self.cheapestDrivers.count
        default:
          return  self.closestDrivers.count
        
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView()
        let titleLabel = UILabel()
        customView.addSubview(titleLabel)
       
        if section == 1{
            titleLabel.text = "Tomorrow"
        }else{
             titleLabel.text = "Today"
        }
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(-15)
        }
        return customView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        if codeSegmented.selectedIndex == 0 {
        if self.closestDrivers.count > 0 && self.tomorrowDrivers.count > 0 {
            if indexPath.section == 0 {
                cell.fromPlaceLabel.text = self.closestDrivers[indexPath.row].fromPlace
                cell.toPlaceLabel.text = self.closestDrivers[indexPath.row].toPlace
                cell.fromtimeLabel.text = self.closestDrivers[indexPath.row].fromDate
                cell.totimeLabel.text = self.closestDrivers[indexPath.row].toDate
                cell.usernameLabel.text = self.closestDrivers[indexPath.row].name
                cell.priceLabel.text = self.closestDrivers[indexPath.row].price + " sum"
            }
            if indexPath.section == 1 {
                cell.fromPlaceLabel.text = self.tomorrowDrivers[indexPath.row].fromPlace
                cell.toPlaceLabel.text = self.tomorrowDrivers[indexPath.row].toPlace
                cell.fromtimeLabel.text = self.tomorrowDrivers[indexPath.row].fromDate
                cell.totimeLabel.text = self.tomorrowDrivers[indexPath.row].toDate
                cell.usernameLabel.text = self.tomorrowDrivers[indexPath.row].name
                cell.priceLabel.text = self.tomorrowDrivers[indexPath.row].price + " sum"
            }
        }else{
        cell.fromPlaceLabel.text = self.drivers[indexPath.row].fromPlace
        cell.toPlaceLabel.text = self.drivers[indexPath.row].toPlace
        cell.fromtimeLabel.text = self.drivers[indexPath.row].fromDate
        cell.totimeLabel.text = self.drivers[indexPath.row].toDate
        cell.usernameLabel.text = self.drivers[indexPath.row].name
        cell.priceLabel.text = self.drivers[indexPath.row].price + " sum"
        }
        } else if codeSegmented.selectedIndex == 1{
            cell.fromPlaceLabel.text = self.cheapestDrivers[indexPath.row].fromPlace
            cell.toPlaceLabel.text = self.cheapestDrivers[indexPath.row].toPlace
            cell.fromtimeLabel.text = self.cheapestDrivers[indexPath.row].fromDate
            cell.totimeLabel.text = self.cheapestDrivers[indexPath.row].toDate
            cell.usernameLabel.text = self.cheapestDrivers[indexPath.row].name
            cell.priceLabel.text = self.cheapestDrivers[indexPath.row].price + " sum"
        }else{
            cell.fromPlaceLabel.text = self.closestDrivers[indexPath.row].fromPlace
            cell.toPlaceLabel.text = self.closestDrivers[indexPath.row].toPlace
            cell.fromtimeLabel.text = self.closestDrivers[indexPath.row].fromDate
            cell.totimeLabel.text = self.closestDrivers[indexPath.row].toDate
            cell.usernameLabel.text = self.closestDrivers[indexPath.row].name
            cell.priceLabel.text = self.closestDrivers[indexPath.row].price + " sum"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var driver : Drivers!
        switch codeSegmented.selectedIndex {
        case 0:
             driver = self.drivers[indexPath.row]
        case 1:
            driver = self.cheapestDrivers[indexPath.row]
        default:
            driver = self.closestDrivers[indexPath.row]
        }
        self.navigationController?.pushViewController(DetailViewController(fromPlace: self.fromPlace, toPlace: self.toPlace, personCount: personCount, driver: driver), animated: true)
    }
}

extension DataSnapshot {
  var valueToJSON: Data {
      guard let dictionary = value as? [String: Any] else {
          return Data()
      }
      return dictionary.JSON
  }

  var listToJSON: Data {
      guard let object = children.allObjects as? [DataSnapshot] else {
          return Data()
      }

      let dictionary: [NSDictionary] = object.compactMap { $0.value as? NSDictionary }

      do {
          return try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
      } catch {
          return Data()
      }
  }
}

extension Dictionary {
    var JSON: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}


extension ListViewController: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        self.codeSegmented.setIndex(index: index)
        switch codeSegmented.selectedIndex {
        case 0:
            self.tableView.reloadData()
        case 1:
            let driver = self.drivers.min{ Int($0.price)! < Int($1.price)! }
            self.cheapestDrivers.removeAll()
            if let driver = driver {
                self.cheapestDrivers.append(driver)
            }else{
                self.cheapestDrivers = []
            }
            self.tableView.reloadData()
        default:
            self.tableView.reloadData()
        
        }
    }
}
