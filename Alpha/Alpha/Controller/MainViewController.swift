//
//  MainViewController.swift
//  Alpha
//
//  Created by Vlad Lopes on 26/08/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


  
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!

    
    var letters: [String] = []
    var group = 0
    var option = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.setTitle(groups[0], for: .normal)
        button1.layer.borderWidth = 2.5
        button1.layer.borderColor = UIColor.white.cgColor
        button1.layer.masksToBounds = true
        button2.setTitle(groups[1], for: .normal)
        button2.layer.borderWidth = 2.5
        button2.layer.borderColor = UIColor.white.cgColor
        button2.layer.masksToBounds = true
        button3.setTitle(groups[2], for: .normal)
        button3.layer.borderWidth = 2.5
        button3.layer.borderColor = UIColor.white.cgColor
        button3.layer.masksToBounds = true
        button4.setTitle(groups[3], for: .normal)
        button4.layer.borderWidth = 2.5
        button4.layer.borderColor = UIColor.white.cgColor
        button4.layer.masksToBounds = true
        button5.setTitle(groups[4], for: .normal)
        button5.layer.borderWidth = 2.5
        button5.layer.borderColor = UIColor.white.cgColor
        button5.layer.masksToBounds = true
        button6.setTitle(groups[5], for: .normal)
        button6.layer.borderWidth = 2.5
        button6.layer.borderColor = UIColor.white.cgColor
        button6.layer.masksToBounds = true
        button7.setTitle(groups[6], for: .normal)
        button7.layer.borderWidth = 2.5
        button7.layer.borderColor = UIColor.white.cgColor
        button7.layer.masksToBounds = true
  

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupSegue" {
            if let destination = segue.destination as? GroupViewController {
                destination.group = group
            }
        }
    }
    
    @IBAction func groupPressed(_ sender: UIButton) {
        group = sender.tag
        performSegue(withIdentifier: "GroupSegue", sender: nil)
    }
    
    
    @IBAction func aboutPressed(_ sender: UIButton) {
    }
    
}
