//
//  MainViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import FloatingPanel


class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView    = UITableView()
    var fpc: FloatingPanelController!
    var fromSelected = false
    var fromCity : Address!
    var toCity : Address!
    var personCount = "1"
    var date = ""

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeConstraints()
        
        title = ""
        setFloatingPanel()
        fpc.hide()
        tableView.register(MainCell.self, forCellReuseIdentifier: "MainCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none

    }
    
    func makeConstraints(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as? MainCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.fromButton.addTarget(self, action: #selector(didTapFromButton), for: .touchUpInside)
        cell.toButton.addTarget(self, action: #selector(didTapToButton), for: .touchUpInside)
        cell.searchButton.addTarget(self, action: #selector(didTapSearchButton), for: .touchUpInside)
                
        cell.personTextField.delegate = self
        if self.fromCity != nil {
            cell.fromLabel.text = self.fromCity.city
        }
        if self.toCity != nil {
            cell.toLabel.text = self.toCity.city
        }
        return cell
    }
    
    
    @objc func didTapFromButton(){
        fromSelected = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
            self.fpc.show()
        }, completion: nil)
    }
   
    @objc func didTapToButton(){
        fromSelected = false
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
            self.fpc.show()
        }, completion: nil)
    }
    @objc func didTapSearchButton(){
        if fromCity != nil && toCity != nil {
            if date == "" {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                date = formatter.string(from: Date())
            }
           
            
        self.navigationController?.pushViewController(ListViewController(fromPlace: fromCity, toPlace: toCity, date: date, personCount: personCount), animated: true)
            self.tabBarController?.hidesBottomBarWhenPushed = true
        }
    }
}

extension MainViewController: MainCellDelegate{
    func didSelectCalendar(date: String) {
        self.date = date
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.personCount = textField.text ?? ""
    }
}


extension MainViewController: FloatingPanelControllerDelegate {
  
    func setFloatingPanel(){
        fpc = FloatingPanelController(delegate: self)
        fpc.layout = MyFloatingPanelLayout()
        let contentVC = BottomSheetController()
        fpc.set(contentViewController: contentVC)
        contentVC.delegate = self
        fpc.track(scrollView: contentVC.tableView)
        fpc.addPanel(toParent: self)
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 15
        appearance.backgroundColor = .clear
        fpc.surfaceView.appearance = appearance
    }
}

class MyFloatingPanelLayout: FloatingPanelLayout {
    
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .full
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}


extension MainViewController: BottomSheetDelegate{
    func didTapOnCity(city: Address) {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
            self.fpc.hide()
        }, completion: nil)
        switch fromSelected {
        case true:
            self.fromCity = city
        case false:
            self.toCity = city
        }
        self.tableView.reloadData()
    }
}
