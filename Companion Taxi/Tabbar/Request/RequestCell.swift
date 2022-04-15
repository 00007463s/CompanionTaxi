//
//  RequestCell.swift
//  Companion Taxi
//
//  Created by Malika on 15/04/22.
//

import UIKit

class RequestCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let fromTextField = UITextField()
    let toTextField = UITextField()
    let dateTextField = UITextField()
    let timeTextField = UITextField()
    let numberOfPassengersTextField = UITextField()
    let priceTextField = UITextField()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        
        self.contentView.addSubview(titleLabel)
        titleLabel.text = "Enter trip details"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.left.equalTo(22)
            make.right.equalTo(-22)
        }
        
        let fromView = customView()
        self.contentView.addSubview(fromView)
        fromView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.height.equalTo(50)
        }
        
        
        let toView = customView()
        self.contentView.addSubview(toView)
        toView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(fromView.snp.bottom).offset(22)
            make.height.equalTo(50)
        }
        
        let dateView = customView()
        self.contentView.addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(toView.snp.bottom).offset(22)
            make.height.equalTo(50)
        }
        
        let timeView = customView()
        self.contentView.addSubview(timeView)
        timeView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(dateView.snp.bottom).offset(22)
            make.height.equalTo(50)
        }
        
        let passengerView = customView()
        self.contentView.addSubview(passengerView)
        passengerView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(timeView.snp.bottom).offset(22)
            make.height.equalTo(50)
        }
        
        let priceView = customView()
        self.contentView.addSubview(priceView)
        priceView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(passengerView.snp.bottom).offset(22)
            make.height.equalTo(50)
            make.bottom.equalTo(-300)
        }
        
        fromView.addSubview(fromTextField)
        fromTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        toView.addSubview(toTextField)
        toTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        dateView.addSubview(dateTextField)
        dateTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        timeView.addSubview(timeTextField)
        timeTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        passengerView.addSubview(numberOfPassengersTextField)
        numberOfPassengersTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        priceView.addSubview(priceTextField)
        priceTextField.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.top.equalToSuperview()
        }
        
        fromTextField.placeholder = "From"
        toTextField.placeholder   = "To"
        dateTextField.placeholder = "Date"
        timeTextField.placeholder = "Time"
        numberOfPassengersTextField.placeholder = "Number of passengers"
        priceTextField.placeholder = "Price"
        
        fromTextField.font = UIFont.boldSystemFont(ofSize: 18)
        toTextField.font = UIFont.boldSystemFont(ofSize: 18)
        dateTextField.font = UIFont.boldSystemFont(ofSize: 18)
        timeTextField.font = UIFont.boldSystemFont(ofSize: 18)
        numberOfPassengersTextField.font = UIFont.boldSystemFont(ofSize: 18)
        priceTextField.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func customView() -> UIView {
        let customView = UIView()
        customView.layer.cornerRadius = 15
        customView.backgroundColor = UIColor.init(hexString: "#E5E5E5")
        
        return customView
    }
}
