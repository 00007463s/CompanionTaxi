//
//  CheckDetails.swift
//  Companion Taxi
//
//  Created Malika on 14/04/22.
//

import UIKit


class CheckDetailsCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let fromdateLabel = UILabel()
    let todateLabel = UILabel()
    let fromPlaceLabel = UILabel()
    let toPlaceLabel = UILabel()
    let priceValueLabel = UILabel()
    let priceTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        
        self.contentView.addSubview(titleLabel)
        titleLabel.text = "Check your booking details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        self.contentView.addSubview(dateLabel)
        
        dateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(20)
        }
        
        fromdateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        fromPlaceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.contentView.addSubview(fromdateLabel)
        fromdateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(15)
            make.left.equalTo(20)
            make.width.equalTo(80)
            
        }
        
        self.contentView.addSubview(fromPlaceLabel)
        fromPlaceLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(15)
            make.left.equalTo(fromdateLabel.snp.right).offset(20)
            make.width.equalTo(80)
            make.right.equalTo(-20)
            
        }
        
        
        todateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        toPlaceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        self.contentView.addSubview(todateLabel)
        todateLabel.snp.makeConstraints { make in
            make.top.equalTo(fromdateLabel.snp.bottom).offset(15)
            make.left.equalTo(20)
            make.width.equalTo(80)
            
        }
        
        self.contentView.addSubview(toPlaceLabel)
        toPlaceLabel.snp.makeConstraints { make in
            make.top.equalTo(fromdateLabel.snp.bottom).offset(15)
            make.left.equalTo(todateLabel.snp.right).offset(20)
            make.width.equalTo(80)
            make.right.equalTo(-20)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(2)
            make.top.equalTo(toPlaceLabel.snp.bottom).offset(25)
        }
        
        self.contentView.addSubview(priceTitleLabel)
        priceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(25)
            make.left.equalTo(20)
        }
        
        priceTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceTitleLabel.textColor = .lightGray
        priceValueLabel.font = UIFont.boldSystemFont(ofSize: 20)

        
        self.contentView.addSubview(priceValueLabel)
        priceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(25)
            make.right.equalTo(-20)
        }
        
    }
}
