//
//  UserCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit



class UserCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let roundedView = UIView()
    let languageLabel = UILabel()
    let languageView = UIView()
    let nameView = UIView()
    let surnameView = UIView()
    let cityView = UIView()
    var nameTextField = UITextField()
    var surnameTextField = UITextField()
    var cityTextField = UITextField()

    
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
        
        iconImageView.image = UIImage(named: "1")
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
        
        nameView.backgroundColor = .white
        nameView.layer.cornerRadius = 15
        self.addSubview(nameView)
        nameView.snp.makeConstraints { make in
            make.top.equalTo(chooseLanguageLabel.snp.bottom).offset(42)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
     
        nameTextField.textColor = .black
        nameTextField.tag = 0
        nameTextField.placeholder = "Name"
        nameView.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
            make.width.equalTo(100)
        }
      
        surnameView.backgroundColor = .white
        surnameView.layer.cornerRadius = 15
        self.addSubview(surnameView)
        surnameView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(21)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        surnameView.addSubview(surnameTextField)
        surnameTextField.placeholder = "Surname"
        surnameTextField.tag = 1
        surnameTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.bottom.equalToSuperview()
        }
        
        cityView.backgroundColor = .white
        cityView.layer.cornerRadius = 15
        self.addSubview(cityView)
        cityView.snp.makeConstraints { make in
            make.top.equalTo(surnameView.snp.bottom).offset(21)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        cityView.addSubview(cityTextField)
        cityTextField.placeholder = "City"
        cityTextField.tag = 2
        cityTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.bottom.equalToSuperview()
        }
        
        DispatchQueue.main.async {
            self.roundedView.roundCorners(corners: [.topLeft, .topRight], radius: 130.0)
        }
    }
    
}

