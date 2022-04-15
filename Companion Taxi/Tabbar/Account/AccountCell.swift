//
//  AccountCell.swift
//  Companion Taxi
//
//  Created by Malika on 15/04/22.
//

import UIKit

class AccountCell: UITableViewCell {
    @IBOutlet weak var topIconView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topIconView.layer.cornerRadius = topIconView.frame.width/2
        topIconView.clipsToBounds = true
    }
    
}
