//
//  ListCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit

class ListCell: UITableViewCell {
    
    let shadowView = UIView()
    let fromtimeLabel = UILabel()
    let totimeLabel = UILabel()
    var fromPlaceLabel = UILabel()
    var toPlaceLabel = UILabel()
    var usernameLabel = UILabel()
    var priceLabel = UILabel()
    let circleView1 = UIView()
    let circleView2 = UIView()
    let circleView3 = UIView()
    let circleView4 = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        self.contentView.addSubview(shadowView)
        
        shadowView.layer.cornerRadius = 20
        shadowView.layer.borderColor = UIColor.lightGray.cgColor
        shadowView.layer.borderWidth = 3
        
        shadowView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        
        fromtimeLabel.text = "13:15"
        fromtimeLabel.font = UIFont.boldSystemFont(ofSize: 15)

        shadowView.addSubview(fromtimeLabel)
        fromtimeLabel.snp.makeConstraints { make in
            make.top.equalTo(27)
            make.left.equalTo(25)
            make.width.equalTo(100)
        }
        
        fromPlaceLabel.text = "Bukhoro"
        fromPlaceLabel.font = UIFont.boldSystemFont(ofSize: 20)

        shadowView.addSubview(fromPlaceLabel)
        fromPlaceLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.left.equalTo(fromtimeLabel.snp.right).offset(15)
            make.right.equalTo(-15)
        }
        
        
        totimeLabel.text = "14:15"
        totimeLabel.font = UIFont.boldSystemFont(ofSize: 15)

        shadowView.addSubview(totimeLabel)
        totimeLabel.snp.makeConstraints { make in
            make.top.equalTo(fromtimeLabel.snp.bottom).offset(20)
            make.left.equalTo(25)
            make.width.equalTo(100)
        }
        
        toPlaceLabel.text = "Bukhoro"
        toPlaceLabel.font = UIFont.boldSystemFont(ofSize: 20)

        shadowView.addSubview(toPlaceLabel)
        toPlaceLabel.snp.makeConstraints { make in
            make.top.equalTo(fromtimeLabel.snp.bottom).offset(20)
            make.left.equalTo(totimeLabel.snp.right).offset(15)
            make.right.equalTo(-15)
        }
        
        usernameLabel.text = "Anvar"
        usernameLabel.font = UIFont.systemFont(ofSize: 20)

        shadowView.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.top.equalTo(totimeLabel.snp.bottom).offset(70)
            make.bottom.lessThanOrEqualTo(-25)
        }
        
        priceLabel.text = "70.000sum"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        shadowView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.right.equalTo(-25)
            make.top.equalTo(totimeLabel.snp.bottom).offset(70)
            make.bottom.lessThanOrEqualTo(-25)
        }
        
        DispatchQueue.main.async {
            self.circleView1.layer.cornerRadius = self.circleView1.frame.width/2
            self.circleView1.clipsToBounds = true
            
            self.circleView2.layer.cornerRadius = self.circleView2.frame.width/2
            self.circleView2.clipsToBounds = true
            
            self.circleView3.layer.cornerRadius = self.circleView3.frame.width/2
            self.circleView3.clipsToBounds = true
            
            self.circleView4.layer.cornerRadius = self.circleView4.frame.width/2
            self.circleView4.clipsToBounds = true
        }
      
        self.circleView1.backgroundColor = UIColor.init(hexString: "#E9932F")
        self.circleView2.backgroundColor = UIColor.init(hexString: "#E9932F")

        self.circleView3.backgroundColor = UIColor.lightGray
        self.circleView4.backgroundColor = UIColor.lightGray

        
        shadowView.addSubview(self.circleView4)
        self.circleView4.snp.makeConstraints { make in
            make.right.equalTo(-25)
            make.top.equalTo(25)
            make.width.height.equalTo(15)
        }
        
        shadowView.addSubview(self.circleView3)
        self.circleView3.snp.makeConstraints { make in
            make.right.equalTo(self.circleView4.snp.left).offset(-5)
            make.top.equalTo(25)
            make.width.height.equalTo(15)
        }
        
        shadowView.addSubview(self.circleView2)
        self.circleView2.snp.makeConstraints { make in
            make.right.equalTo(self.circleView3.snp.left).offset(-5)
            make.top.equalTo(25)
            make.width.height.equalTo(15)
        }
        
        shadowView.addSubview(self.circleView1)
        self.circleView1.snp.makeConstraints { make in
            make.right.equalTo(self.circleView2.snp.left).offset(-5)
            make.top.equalTo(25)
            make.width.height.equalTo(15)
        }
        
    }
}
