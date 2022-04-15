//
//  SuccessViewController.swift
//  Companion Taxi
//
//  Created Malika on 15/04/22.
//

import UIKit


class SuccessViewController: UIViewController{
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "Group (4)")
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalTo(145)
        }
        
        self.view.addSubview(self.titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.text = "Successful!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
}
