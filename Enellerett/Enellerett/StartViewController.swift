//
//  StartViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 10/09/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var imgStart: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgStart.fadeOut()
        imgStart.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.performSegue(withIdentifier: "segueMain", sender: nil)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    extension UIView {
        func fadeIn(_ duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {self.alpha = 1.0}, completion: completion)
        }
        func fadeOut(_ duration: TimeInterval = 2.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {self.alpha = 0.0}, completion: completion)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
