//
//  EventDetailTableViewCell.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 14/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class EventDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
