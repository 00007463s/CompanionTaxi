//
//  HowWantPayViewController.swift
//  Companion Taxi
//
//  Created by Malika on 14/04/22.
//

import UIKit

class HowWantPayViewController: UIViewController{
    let backButton = UIButton()
    
    let cardLabel = UILabel()
    let cardButton = UIButton()
    let cashLabel = UILabel()
    let cashButton = UIButton()
    let titleLabel = UILabel()
    let cardView = UIView()
    let cashView = UIView()
  
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        backButton.setImage(UIImage(named: "back"), for: .normal)
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        backButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
      
        
        makeUI()
    }
    
    func makeUI(){
        self.view.addSubview(titleLabel)
        titleLabel.text = "How do you want to pay?"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        self.view.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        
        self.view.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(8)
            make.top.equalTo(cardView.snp.bottom)
        }
        
        self.view.addSubview(cashView)
        cashView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalTo(lineView.snp.bottom)
        }
        
        self.cardView.addSubview(cardLabel)
        cardLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        self.cardView.addSubview(cardButton)
        cardButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.cashView.addSubview(cashLabel)
        cashLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        self.cashView.addSubview(cashButton)
        cashButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cardLabel.text = "Card"
        cashLabel.text = "Cash"
        cardLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cashLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        let nextImage1 = UIImageView(image: UIImage(named: "Vector (5)"))
        let nextImage2 = UIImageView(image: UIImage(named: "Vector (5)"))

        cardView.addSubview(nextImage1)
        nextImage1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        
        cashView.addSubview(nextImage2)
        nextImage2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        
        self.cardButton.addTarget(self, action: #selector(cardButtonAction), for: .touchUpInside)
        self.cashButton.addTarget(self, action: #selector(cashButtonAction), for: .touchUpInside)
    }
    
    @objc func cardButtonAction(){
        let vc = PaymentTypeViewContoller()
        vc.onDoneBlock = { type in
            
            self.navigationController?.pushViewController(PaymentDataViewController(), animated: true)
        }
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func cashButtonAction(){
       self.navigationController?.pushViewController(SuccessViewController(), animated: true)
    }
    
    @objc func nextVC(){
    }
    
    @objc func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
