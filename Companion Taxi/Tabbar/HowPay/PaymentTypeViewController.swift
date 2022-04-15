//
//  PaymentTypeView.swift
//  Companion Taxi
//
//  Created by Malika on 14/04/22.
//

import UIKit

enum PaymentType {
     case uzcard
     case humo
}

class PaymentTypeViewContoller: UIViewController {
    
    var onDoneBlock : ((PaymentType) -> Void)?

    let customView = UIView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    let humoView = UIView()
    let uzcardView = UIView()
    let uzcardButton = UIButton()
    let humoButton = UIButton()
    private let blurEffect = (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        self.view.addSubview(customView)
        customView.layer.cornerRadius = 20
        customView.backgroundColor = .lightGray
        customView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(180)
        }
        
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let blurView = UIVisualEffectView(frame: UIScreen.main.bounds)
        blurEffect.setValue(10, forKeyPath: "blurRadius")
        blurView.effect = blurEffect
        view.addSubview(blurView)
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        self.view.bringSubviewToFront(backButton)

        self.view.bringSubviewToFront(customView)
        
        customView.addSubview(titleLabel)
        titleLabel.text = "Choose type of a card"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints { make in
            make.right.top.equalToSuperview()
            make.left.equalTo(20)
            make.height.equalTo(60)
        }
        
        customView.addSubview(uzcardView)
        uzcardView.backgroundColor = .black
        uzcardView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        customView.addSubview(humoView)
        humoView.backgroundColor = .black

        humoView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(60)
        }
        
        let nextImage1 = UIImageView(image: UIImage(named: "Vector (6)"))
        let nextImage2 = UIImageView(image: UIImage(named: "Vector (6)"))
        uzcardView.addSubview(nextImage1)
        nextImage1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        
        humoView.addSubview(nextImage2)
        nextImage2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        
        let uzcardLabel = UILabel()
        let humoLabel = UILabel()
        
        uzcardLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        humoLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)

        uzcardLabel.textColor = .lightGray
        humoLabel.textColor = .lightGray
      
        uzcardLabel.text = "UZCARD"
        humoLabel.text = "HUMO"
        
        uzcardView.addSubview(uzcardLabel)
        uzcardLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(25)
        }
        
        humoView.addSubview(humoLabel)
        humoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(25)
        }
        
        uzcardView.addSubview(uzcardButton)
        uzcardButton.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        uzcardView.bringSubviewToFront(uzcardButton)
        uzcardButton.addTarget(self, action: #selector(uzcardButtonAction), for: .touchUpInside)
        
        humoView.addSubview(humoButton)
        humoButton.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        humoView.bringSubviewToFront(humoButton)
        humoButton.addTarget(self, action: #selector(humoButtonAction), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.async {
            self.humoView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
        }
    }
    
    @objc func uzcardButtonAction(){
        self.dismiss(animated: true) {
            self.onDoneBlock?(.uzcard)
        }
    }
    
    @objc func humoButtonAction(){
        self.dismiss(animated: true) {
            self.onDoneBlock?(.humo)
        }
    }
    
    @objc func backButtonPressed(){
        self.dismiss(animated: true)
    }
}
