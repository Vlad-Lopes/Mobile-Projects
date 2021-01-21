//
//  LetterViewController.swift
//  Alpha
//
//  Created by Vlad Lopes on 27/08/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit
import AVFoundation

class LetterViewController: UIViewController {
    
    @IBOutlet weak var letterLabel: UILabel!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var nextButtonBase: NSLayoutConstraint!
    
    var letter: String!
    var group: Int!
    var player: AVAudioPlayer?
    var keyLetter = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterLabel.text = letter
        letterLabel.adjustsFontSizeToFitWidth = true
        nextButton.layer.masksToBounds = true
        
/*        let width = UIScreen.main.bounds.width
        if width < 400 {
            mainStack.spacing = 10
        }
*/
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        if width < 400 {
            mainStack.spacing = 13
        }
        if height < 700 {
            nextButtonBase.constant = -30
        }
    }
 
    
    @IBAction func reversePressed(_ sender: UIButton) {
        
        
        if keyLetter == true {
            let index = alphabet.firstIndex(of: letterLabel.text!)
            letterLabel.text = keys[index!]
            keyLetter = false
        } else {
            letterLabel.text = letter
            keyLetter = true
        }
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        let index = alphabet.firstIndex(of: letter)
        let sound = sounds[index!]
        if let url = Bundle.main.url(forResource: sound, withExtension: "mp3", subdirectory: "Sounds"){

            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error trying to play the sound")
            }
        }
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        var index = alphabet.firstIndex(of: letter)
        var groupInd = 0
        if group == 5 {
            if index == 32 {
                index = 0
            } else {
                index = index! + 1
            }
            letter = alphabet[index!]
        } else {
            switch group {
            case 0:
                groupInd = group1.firstIndex(of: index!)!
                if groupInd == 5 {
                    index = group1[0]
                } else {
                    index = group1[groupInd + 1]
                }
            case 1:
                groupInd = group2.firstIndex(of: index!)!
                if groupInd == 5 {
                    index = group2[0]
                } else {
                    index = group2[groupInd + 1]
                }
            case 2:
                groupInd = group3.firstIndex(of: index!)!
                if groupInd == 8 {
                    index = group3[0]
                } else {
                    index = group3[groupInd + 1]
                }
            case 3:
                groupInd = group4.firstIndex(of: index!)!
                if groupInd == 5 {
                    index = group4[0]
                } else {
                    index = group4[groupInd + 1]
                }
            case 4:
                groupInd = group5.firstIndex(of: index!)!
                if groupInd == 5 {
                    index = group5[0]
                } else {
                    index = group5[groupInd + 1]
                }
            default:
                return
            }
            letter = alphabet[index!]
        }
        letterLabel.text = letter
        keyLetter = true
    }
    

}
