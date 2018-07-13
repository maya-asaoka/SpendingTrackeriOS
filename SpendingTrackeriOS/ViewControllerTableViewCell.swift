//
//  ViewControllerTableViewCell.swift
//  SpendingTrackeriOS
//
//  Created by Maya Asaoka on 2018-07-09.
//  Copyright © 2018 Maya Asaoka. All rights reserved.
//

// for displaying entries

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var desc2: UILabel!
    @IBOutlet weak var amount2: UILabel!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var category2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
