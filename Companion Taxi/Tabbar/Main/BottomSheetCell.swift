//
//  BottomSheetCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit
import SnapKit



class BottomSheetCell: UITableViewCell {
    
    let titleLabel = UILabel()
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints(){
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 18)
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        let lineView = UIView()
        lineView.backgroundColor = .lightGray
        
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview()
        }
    }
}
