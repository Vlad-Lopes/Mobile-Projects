//
//  AboutViewController.swift
//  Alpha
//
//  Created by Vlad Lopes on 28/08/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutLabel: UILabel!
    var flag = "se"
    @IBOutlet weak var flagButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        aboutLabel.text = aboutSe
        flagButton.layer.masksToBounds = true
        flagButton.setImage(UIImage(named: "UnitedKingdom.png"), for: .normal)
    }

    @IBAction func flagPressed(_ sender: UIButton) {
        if flag == "se" {
            flag = "en"
            aboutLabel.text = aboutEn
            flagButton.setImage(UIImage(named: "Sweden.png"), for: .normal)
            navigationItem.title = "About this app"
        } else {
            flag = "se"
            aboutLabel.text = aboutSe
            flagButton.setImage(UIImage(named: "UnitedKingdom.png"), for: .normal)
            navigationItem.title = "Om appar"
        }
    }
}
