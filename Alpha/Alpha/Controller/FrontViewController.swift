//
//  FrontViewController.swift
//  Alpha
//
//  Created by Vlad Lopes on 29/08/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {
    
    @IBOutlet weak var babView: UIImageView!
    
    @IBOutlet weak var borjaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.babView.image = UIImage(imageLiteralResourceName: "bab1.png")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animate1()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.animate2()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.borjaButton.isHidden = false
        }
    }
    
    func animate1() {
        UIView.transition(with: self.babView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.babView.image = UIImage(imageLiteralResourceName: "bab2.png")
               }, completion: nil)
    }
    
    func animate2() {
        UIView.transition(with: self.babView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.babView.image = UIImage(imageLiteralResourceName: "bab3.png")
               }, completion: nil)
    }
    
    
}
