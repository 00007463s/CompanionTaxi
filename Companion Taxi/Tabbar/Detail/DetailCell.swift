//
//  DetailCell.swift
//  Companion Taxi
//
//  Created by Malika on 13/04/22.
//

import UIKit

class DetailCell: UITableViewCell {
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var carTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var toPlaceLabel: UILabel!
    @IBOutlet weak var totimeLabel: UILabel!
    @IBOutlet weak var fromPlaceLabel: UILabel!
    @IBOutlet weak var fromtimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.fromtimeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.fromPlaceLabel.font = UIFont.boldSystemFont(ofSize: 18)

        self.totimeLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.toPlaceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.priceLabel.font = UIFont.boldSystemFont(ofSize: 18)

        self.nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        self.carTypeLabel.font = UIFont.boldSystemFont(ofSize: 18)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
