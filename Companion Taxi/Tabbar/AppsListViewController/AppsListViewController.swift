//
//  AppsListViewController.swift
//  Companion Taxi
//
//  Created Malika on 15/04/22.
//

import UIKit

enum Apps {
     case ipak
     case apelsin
}

class AppsListViewController: UIViewController {
    
    var onDoneBlock : ((Apps) -> Void)?

    let customView = UIView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    let apelsinView = UIView()
    let ipakView = UIView()
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
        titleLabel.text = "Choose payment app"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.snp.makeConstraints { make in
            make.right.top.equalToSuperview()
            make.left.equalTo(20)
            make.height.equalTo(60)
        }
        
        customView.addSubview(ipakView)
        ipakView.backgroundColor = .black
        ipakView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        customView.addSubview(apelsinView)
        apelsinView.backgroundColor = .black

        apelsinView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(60)
        }
        
        let nextImage1 = UIImageView(image: UIImage(named: "Vector (6)"))
        let nextImage2 = UIImageView(image: UIImage(named: "Vector (6)"))
        ipakView.addSubview(nextImage1)
        nextImage1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        
        apelsinView.addSubview(nextImage2)
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
      
        uzcardLabel.text = "Ipak Yo'li Mobile"
        humoLabel.text = "Apelsin"
        
        ipakView.addSubview(uzcardLabel)
        uzcardLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(25)
        }
        
        apelsinView.addSubview(humoLabel)
        humoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(25)
        }
        
        ipakView.addSubview(uzcardButton)
        uzcardButton.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        ipakView.bringSubviewToFront(uzcardButton)
        uzcardButton.addTarget(self, action: #selector(ipakButtonAction), for: .touchUpInside)
        
        apelsinView.addSubview(humoButton)
        humoButton.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        apelsinView.bringSubviewToFront(humoButton)
        humoButton.addTarget(self, action: #selector(apelsinButtonAction), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.async {
            self.apelsinView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20)
        }
    }
    
    @objc func ipakButtonAction(){
        self.dismiss(animated: true) {
            self.onDoneBlock?(.ipak)
        }
    }
    
    @objc func apelsinButtonAction(){
        self.dismiss(animated: true) {
            self.onDoneBlock?(.apelsin)
        }
    }
    
    @objc func backButtonPressed(){
        self.dismiss(animated: true)
    }
}
