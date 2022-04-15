//
//  PhoneView.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit


protocol PhoneCellDelegate: AnyObject {
    func didEnterPhoneNumber(phoneNumber: String)
    func didEnterCode(code: String)
}

class PhoneCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let roundedView = UIView()
    let languageLabel = UILabel()
    let languageView = UIView()
    let numberView = UIView()
    let codeView = UIView()
    let phonePrefixLabel = UILabel()
    var phoneTextField = UITextField()
    var codeTextField = UITextField()
    var showCodeView = false

    weak var delegate: PhoneCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeConstraints(){
        titleLabel.text = "Companion Taxi"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.contentView.addSubview(titleLabel)
        
        iconImageView.image = UIImage(named: "Workflow")
        self.contentView.addSubview(iconImageView)
        
        roundedView.backgroundColor = .black
        self.contentView.addSubview(roundedView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin).offset(15)
            make.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
//            make.leading.equalTo(78)
//            make.trailing.equalTo(-78)
            make.height.equalTo(250)
            make.centerX.equalToSuperview()
        }
    
        roundedView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(-20)
            make.trailing.equalTo(20)
            make.top.equalTo(iconImageView.snp.bottom)
        }
        
        let chooseLanguageLabel = UILabel()
        chooseLanguageLabel.text = "Register As"
        chooseLanguageLabel.textColor = .white
        chooseLanguageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.addSubview(chooseLanguageLabel)
        chooseLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(roundedView.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }
        
        numberView.backgroundColor = .white
        numberView.layer.cornerRadius = 15
        self.addSubview(numberView)
        numberView.snp.makeConstraints { make in
            make.top.equalTo(chooseLanguageLabel.snp.bottom).offset(42)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        phonePrefixLabel.textColor = .lightGray
        phonePrefixLabel.text = "+998"
        numberView.addSubview(phonePrefixLabel)
        phonePrefixLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(50)
        }
        
        phoneTextField.textColor = .black
        phoneTextField.keyboardType = .numberPad
        phoneTextField.tag = 0
        phoneTextField.placeholder = "-- --- -- --"
        numberView.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.left.equalTo(phonePrefixLabel.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
            make.width.equalTo(100)
        }
      
        codeView.isHidden = !showCodeView
        codeView.backgroundColor = .white
        codeTextField.keyboardType = .numberPad
        codeView.layer.cornerRadius = 15
        self.addSubview(codeView)
        codeView.snp.makeConstraints { make in
            make.top.equalTo(numberView.snp.bottom).offset(21)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        codeView.addSubview(codeTextField)
        codeTextField.placeholder = "Code"
        codeTextField.tag = 1
        codeTextField.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.bottom.equalToSuperview()
        }
        
        DispatchQueue.main.async {
            self.roundedView.roundCorners(corners: [.topLeft, .topRight], radius: 130.0)
        }
        
        
        phoneTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
       
        codeTextField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        
}
    

    @objc func textDidChange(_ textField: UITextField){
        if textField.tag == 0 {
            if textField.text?.count == 9{
                showCodeView = true
                self.delegate?.didEnterPhoneNumber(phoneNumber: textField.text ?? "")
                codeTextField.isHidden = !showCodeView
                let next = self.viewWithTag(textField.tag + 1) as? UITextField
                next?.becomeFirstResponder()
                makeConstraints()
            }
        }
        if textField.tag == 1 {
            if textField.text?.count == 6 {
                textField.resignFirstResponder()
                self.delegate?.didEnterCode(code: textField.text ?? "")
            }
        }
    }
    
}
