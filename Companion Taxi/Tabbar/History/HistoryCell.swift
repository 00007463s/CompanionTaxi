//
//  HistoryCell.swift
//  Companion Taxi
//
//  Created by Malika on 15/04/22.
//

import UIKit

class HistoryCell: UITableViewCell {
   
    let shadowView = UIView()
    let fromtimeLabel = UILabel()
    let totimeLabel = UILabel()
    let fromPlaceLabel = UILabel()
    let toPlaceLabel = UILabel()
    let dateLabel = UILabel()
    let completedLabel = UILabel()
    let userNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        self.contentView.addSubview(shadowView)
        shadowView.layer.cornerRadius = 25
        shadowView.backgroundColor = UIColor.init(hexString: "#E5E5E5")
        shadowView.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
        }
        
        let topView = UIView()
        topView.backgroundColor = .clear
        shadowView.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        
        topView.addSubview(fromtimeLabel)
        fromtimeLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(18)
            make.width.equalTo(60)
        }
        
        topView.addSubview(totimeLabel)
        totimeLabel.snp.makeConstraints { make in
            make.left.equalTo(12)
            make.top.equalTo(fromtimeLabel.snp.bottom).offset(18)
            make.width.equalTo(60)
            make.bottom.equalTo(-18)
        }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Group 27")
        topView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.equalTo(totimeLabel.snp.right).offset(15)
            make.top.equalTo(21)
            make.width.equalTo(9)
            make.bottom.equalTo(-21)
        }
        
        topView.addSubview(fromPlaceLabel)
        fromPlaceLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(18)
            make.width.equalTo(120)
        }
        
        topView.addSubview(toPlaceLabel)
        toPlaceLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(15)
            make.top.equalTo(fromtimeLabel.snp.bottom).offset(18)
            make.width.equalTo(120)
            make.bottom.equalTo(-18)
        }
        
        fromtimeLabel.textAlignment = .center
        totimeLabel.textAlignment = .center
        
        fromtimeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        totimeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        fromPlaceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        toPlaceLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        dateLabel.font = UIFont.boldSystemFont(ofSize: 17)
        completedLabel.font = UIFont.boldSystemFont(ofSize: 17)

        completedLabel.textColor = UIColor.init(hexString: "#4BAE28")

        fromtimeLabel.text = "18:30"
        totimeLabel.text = "22:30"
        fromPlaceLabel.text = "Tashkent"
        toPlaceLabel.text = "Bukhoro"
        completedLabel.text = "Completed"
        dateLabel.text = "22/04/2022"
        
        shadowView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.right.equalTo(-30)
        }
        
        shadowView.addSubview(completedLabel)
        completedLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.right.equalTo(-30)
            make.bottom.equalTo(self.shadowView.snp.bottom).offset(-30)
        }
        
        let userImage = UIImageView(image: UIImage(named: "Group (3)"))
        shadowView.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.bottom.equalTo(-30)
            make.width.height.equalTo(25)
        }
        
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        userNameLabel.text = "Anvar"
        
        shadowView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.left.equalTo(userImage.snp.right).offset(10)
            make.centerY.equalTo(userImage.snp.centerY)
            make.bottom.equalTo(-30)
        }
    }
}

