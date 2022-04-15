//
//  FinishCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit

class FinishCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let roundedView = UIView()
    let welcomeLabel = UILabel()
   
    
    
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
        
        iconImageView.image = UIImage(named: "Done")
        self.addSubview(iconImageView)
        
        roundedView.backgroundColor = .black
        self.addSubview(roundedView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.topMargin).offset(15)
            make.centerX.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(250)
            make.centerX.equalToSuperview()
        }
    
        roundedView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalTo(-20)
            make.trailing.equalTo(20)
            make.top.equalTo(iconImageView.snp.bottom)
        }
        
        welcomeLabel.text = "Welcome!"
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 35)
        
        self.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(roundedView.snp.top).offset(90)
            make.centerX.equalToSuperview()
        }
        
     
        
        DispatchQueue.main.async {
            self.roundedView.roundCorners(corners: [.topLeft, .topRight], radius: 130.0)
        }
    }
    
    
}
