//
//  RegistrationAsViewController.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit

class RegisterAsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
      
        let tableView = UITableView()
        let continueButton = UIButton()
        var isClient = false
        var isDriver = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            makeConstraints()
            
            tableView.register(RegisterAsCell.self, forCellReuseIdentifier: "RegisterAsCell")
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            continueButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        }
        
        func makeConstraints(){
            self.view.addSubview(tableView)
            tableView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            self.view.addSubview(continueButton)
            continueButton.backgroundColor = UIColor.init(hexString: "E9932F")
            continueButton.setTitle("Continue", for: .normal)
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
        }
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.frame.height
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegisterAsCell", for: indexPath) as? RegisterAsCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            
            cell.driverButton.addTarget(self, action: #selector(chooseDriver), for: .touchUpInside)
            cell.clientButton.addTarget(self, action: #selector(chooseClient), for: .touchUpInside)

            
            if isDriver {
                cell.driverButton.backgroundColor = .lightGray
            }else{
                cell.driverButton.backgroundColor = .white
            }
            
            if isClient {
                cell.clientButton.backgroundColor = .lightGray
            }else{
                cell.clientButton.backgroundColor = .white
            }
            
            return cell
        }
        
    
    @objc func chooseClient(){
        self.isClient = true
        self.isDriver = false
        self.tableView.reloadData()
    }
    
    @objc func chooseDriver(){
        self.isClient = false
        self.isDriver = true
        self.tableView.reloadData()
    }
    
    @objc func nextPage(){
        if isClient || isDriver {
            let vc = PhoneViewController()
            if isClient {
            UserDefaults.standard.setValue("client", forKey: "type")
            }else{
            UserDefaults.standard.setValue("driver", forKey: "type")
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)

        }
    }
    
    
}
