//
//  PaymentDataViewController.swift
//  Companion Taxi
//
//  Created by Malika on 14/04/22.
//

import UIKit

class PaymentDataViewController: UIViewController, UITextFieldDelegate {
    let backButton      = UIButton()
    let continueButton  = UIButton()
    let cardHolderTextField = UITextField()
    let cardNumberTextField = UITextField()
    let issueDateTextField = UITextField()
    
    var cardHolderView : UIView!
    var cardNumberView : UIView!
    var issueDateView  : UIView!
    
    let saveLabel  = UILabel()
    let saveView   = UIView()
    let saveImage  = UIImageView()
    let saveButton = UIButton()
    
    let titleLabel = UILabel()
    
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
        
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "Enter your card details"
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(backButton.snp.bottom).offset(10)
        }
        self.cardHolderView = customView()
        self.view.addSubview(self.cardHolderView)
        cardHolderView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
        
        self.cardNumberView = customView()
        self.view.addSubview(self.cardNumberView)
        cardNumberView.snp.makeConstraints { make in
            make.top.equalTo(cardHolderView.snp.bottom).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(50)
        }
        
        self.issueDateView = customView()
        self.view.addSubview(self.issueDateView)
        issueDateView.snp.makeConstraints { make in
            make.top.equalTo(cardNumberView.snp.bottom).offset(10)
            make.left.equalTo(30)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        self.view.addSubview(saveLabel)
        saveLabel.text = "Save this card for next time"
        saveLabel.snp.makeConstraints { make in
            make.top.equalTo(issueDateView.snp.bottom).offset(10)
            make.left.equalTo(30)
            make.right.equalTo(-30)
        }
        
    
        self.view.addSubview(continueButton)
        continueButton.backgroundColor = UIColor.init(hexString: "E9932F")
        continueButton.setTitle("Pay", for: .normal)
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
        
        self.cardHolderView.addSubview(cardHolderTextField)
        cardHolderTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        self.cardNumberView.addSubview(cardNumberTextField)
        cardNumberTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        self.issueDateView.addSubview(issueDateTextField)
        issueDateTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        cardHolderTextField.placeholder = "Cardholder name"
        cardNumberTextField.placeholder = "Card number"
        issueDateTextField.placeholder = "MM/YY"
        
        cardHolderTextField.font = UIFont.boldSystemFont(ofSize: 18)
        cardNumberTextField.font = UIFont.boldSystemFont(ofSize: 18)
        issueDateTextField.font  = UIFont.boldSystemFont(ofSize: 18)
        
        issueDateTextField.delegate = self
        
        
        issueDateTextField.keyboardType = .numberPad
        issueDateTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        if textField.text?.count == 2{
            textField.text = textField.text! + "/"
        }
        if textField.text?.count == 4{
            return
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textstring = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let length = textstring.count
        if length > 5 {
            return false
        }
        return true
    }
    
    func customView() -> UIView {
        let customView = UIView()
        customView.layer.cornerRadius = 15
        customView.backgroundColor = UIColor.init(hexString: "#E5E5E5")
        
        return customView
    }
    
    @objc func nextVC(){
        let vc = AppsListViewController()
        vc.onDoneBlock = { type in
            
            self.navigationController?.pushViewController(SuccessViewController(), animated: true)
        }
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
