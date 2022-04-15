//
//  RegisterAsCell.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit

class RegisterAsCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let roundedView = UIView()
    let languageLabel = UILabel()
    let languageView = UIView()
    let clientButton = UIButton()
    let driverButton = UIButton()
    
    
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
        
        iconImageView.image = UIImage(named: "Delivery")
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
        
        clientButton.backgroundColor = .white
        clientButton.setTitle("Client", for: .normal)
        clientButton.setTitleColor(.black, for: .normal)
        clientButton.layer.cornerRadius = 15
        self.addSubview(clientButton)
        clientButton.snp.makeConstraints { make in
            make.top.equalTo(chooseLanguageLabel.snp.bottom).offset(42)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        
      
        driverButton.backgroundColor = .white
        driverButton.setTitle("Driver", for: .normal)
        driverButton.setTitleColor(.black, for: .normal)
        driverButton.layer.cornerRadius = 15
        self.addSubview(driverButton)
        driverButton.snp.makeConstraints { make in
            make.top.equalTo(clientButton.snp.bottom).offset(21)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        DispatchQueue.main.async {
            self.roundedView.roundCorners(corners: [.topLeft, .topRight], radius: 130.0)
        }
}
    

    
    
}
