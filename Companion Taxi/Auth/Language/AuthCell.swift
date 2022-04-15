//
//  AuthCell.swift
//  Companion Taxi
//
//  Created by Malika on 12/04/22.
//

import UIKit

class AuthCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let roundedView = UIView()
    let languageLabel = UILabel()
    let languageView = UIView()
    let englishButton = UIButton()
    
    
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
        self.addSubview(titleLabel)
        
        iconImageView.image = UIImage(named: "Journey")
        self.addSubview(iconImageView)
        
        roundedView.backgroundColor = .black
        self.addSubview(roundedView)
        
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
        chooseLanguageLabel.text = "Choose a language"
        chooseLanguageLabel.textColor = .white
        chooseLanguageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.addSubview(chooseLanguageLabel)
        chooseLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(roundedView.snp.top).offset(30)
            make.centerX.equalToSuperview()
        }
        
        englishButton.backgroundColor = .white
        englishButton.setTitle("English", for: .normal)
        englishButton.setTitleColor(.black, for: .normal)
        englishButton.layer.cornerRadius = 15
        self.addSubview(englishButton)
        englishButton.snp.makeConstraints { make in
            make.top.equalTo(chooseLanguageLabel.snp.bottom).offset(42)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(50)
        }
        
        DispatchQueue.main.async {
            self.roundedView.roundCorners(corners: [.topLeft, .topRight], radius: 130.0)
        }
    }
    
    
}



extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
