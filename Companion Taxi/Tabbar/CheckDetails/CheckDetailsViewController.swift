//
//  CheckDetailsViewController.swift
//  Companion Taxi
//
//  Created by Malika on 14/04/22.
//

import UIKit

class CheckDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let backButton = UIButton()
    let tableView = UITableView()
    let continueButton = UIButton()
    
    var driver: Drivers!
    
    init(driver: Drivers){
        super.init(nibName: nil, bundle: nil)
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
        
        tableView.register(CheckDetailsCell.self, forCellReuseIdentifier: "CheckDetailsCell")
        
        self.view.addSubview(continueButton)
        continueButton.backgroundColor = UIColor.init(hexString: "E9932F")
        continueButton.setTitle("Book", for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 15
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
    
    @objc func nextVC(){
        self.navigationController?.pushViewController(HowWantPayViewController(), animated: true)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckDetailsCell") as? CheckDetailsCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.dateLabel.text = self.driver.when
        cell.fromdateLabel.text = self.driver.fromDate
        cell.fromPlaceLabel.text = self.driver.fromPlace
        cell.todateLabel.text = self.driver.toDate
        cell.toPlaceLabel.text = self.driver.toPlace
        cell.priceValueLabel.text = self.driver.price + " sum"
        cell.priceTitleLabel.text = "Total"
        
        return cell
    }
}
