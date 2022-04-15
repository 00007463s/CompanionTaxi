//
//  RequestViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit


class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView  = UITableView()
    let continueButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
        
        tableView.register(RequestCell.self, forCellReuseIdentifier: "RequestCell")
        
        self.view.addSubview(continueButton)
        continueButton.backgroundColor = UIColor.init(hexString: "E9932F")
        continueButton.setTitle("Ride request", for: .normal)
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell") as? RequestCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        
        return cell
    }
}
