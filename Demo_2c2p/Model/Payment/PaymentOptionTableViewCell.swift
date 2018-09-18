//
//  PaymentOptionTableViewCell.swift
//  Demo_2c2p
//
//  Created by Thitiwat Buatip on 14/9/2561 BE.
//  Copyright © 2561 Banana. All rights reserved.
//

import UIKit

class PaymentOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var paymentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
