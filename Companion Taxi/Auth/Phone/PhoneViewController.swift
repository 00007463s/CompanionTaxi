//
//  PhoneViewController.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase

class PhoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
      
        let tableView = UITableView()
        let continueButton = UIButton()
        var verificationId = ""
        var ref: DatabaseReference!

        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            makeConstraints()
            
            tableView.register(PhoneCell.self, forCellReuseIdentifier: "PhoneCell")
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            continueButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
            
            ref = Database.database().reference()
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
            self.continueButton.isEnabled = false
            self.view.bringSubviewToFront(continueButton)
        }
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.view.frame.height
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath) as? PhoneCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.delegate = self
            
            return cell
        }
        
    

    @objc func nextPage(){
      
        let vc = UserDataViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}


extension PhoneViewController: PhoneCellDelegate {
    func didEnterPhoneNumber(phoneNumber: String) {
        let value = UserDefaults.standard.value(forKey: "type")
        
        var userCOUNT = 0
        if let userCount = UserDefaults.standard.value(forKey: "usersCount") as? Int {
            userCOUNT = userCount
        }
        PhoneAuthProvider.provider()
          .verifyPhoneNumber("+998\(phoneNumber)", uiDelegate: nil) { verificationID, error in
              if let error = error {
                return
              }
              self.verificationId = verificationID ?? ""
              guard let key = self.ref.child("users").childByAutoId().key else { return }
              
              
              let post = ["phone": "+998\(phoneNumber)",
                          "type": value,
                          "uid" : UIDevice.current.identifierForVendor!.uuidString
                          ]
              
              let childUpdates = ["/users/\(userCOUNT)": post]
              self.ref.updateChildValues(childUpdates)
          }
    }
    
    func didEnterCode(code: String) {
        self.view.resignFirstResponder()
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: code)

        Auth.auth().signIn(with: credential) { (authResult, error) in
          if let error = error {
            let authError = error as NSError
            print(authError.description)
            return
          }else{
              self.continueButton.isEnabled = true
          }
        }
    }
}
