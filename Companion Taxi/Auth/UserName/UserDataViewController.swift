//
//  UserDataViewController.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import SnapKit

class UserDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
    let tableView = UITableView()
    let continueButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeConstraints()
        
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        
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
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        return cell
    }
    
  
    @objc func nextPage(){
        let vc = FinishViewController()
         vc.modalPresentationStyle = .fullScreen
         self.present(vc, animated: true, completion: nil)
    }
}

