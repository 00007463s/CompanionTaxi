//
//  DetailViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit


class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let backButton = UIButton()
    let searchView = UIView()
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    var fromPlace : Address!
    var toPlace: Address!
    var driver: Drivers!
    var date : Date!
    var personCount = ""
    let continueButton = UIButton()
    
    init(fromPlace: Address, toPlace: Address, date: Date? = nil, personCount: String, driver: Drivers){
        super.init(nibName: nil, bundle: nil)
        self.fromPlace = fromPlace
        self.toPlace = toPlace
        self.date = date
        self.personCount = personCount
        self.driver = driver
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        backButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(2)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "DetailCell")
        
        self.view.addSubview(continueButton)
        continueButton.backgroundColor = UIColor.init(hexString: "E9932F")
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 15
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin).offset(-30)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        self.view.bringSubviewToFront(continueButton)
        continueButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func nextVC(){
        self.navigationController?.pushViewController(CheckDetailsViewController(driver: driver), animated: true)
    }
    
    @objc func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as? DetailCell else {
            return UITableViewCell()
        }
        cell.fromButton.addTarget(self, action: #selector(fromButtonAction), for: .touchUpInside)
        cell.toButton.addTarget(self, action: #selector(toButtonAction), for: .touchUpInside)
        cell.fromtimeLabel.text = self.driver.fromDate
        cell.fromPlaceLabel.text = self.driver.fromPlace
        cell.totimeLabel.text = self.driver.toDate
        cell.toPlaceLabel.text = self.driver.toPlace
        cell.priceLabel.text = self.driver.price + " sum"
        cell.dateLabel.text = self.driver.when
        cell.nameLabel.text = self.driver.name

        cell.selectionStyle = .none
        
        return cell
    }
    
    
    @objc func fromButtonAction(){
        self.navigationController?.pushViewController(MapViewController(latitude: fromPlace.latitude, longitude: fromPlace.longitude, region: "Tashkent"), animated: true)
    }
    
    @objc func toButtonAction(){
        self.navigationController?.pushViewController(MapViewController(latitude: toPlace.latitude, longitude: toPlace.longitude, region: "Tashkent"), animated: true)
    }
}

