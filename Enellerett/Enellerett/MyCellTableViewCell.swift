//
//  MyCellTableViewCell.swift
//  enellerett
//
//  Created by Sidney P'Silva on 06/09/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
