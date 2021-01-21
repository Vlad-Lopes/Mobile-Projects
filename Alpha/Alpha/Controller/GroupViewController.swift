//
//  GroupViewController.swift
//  Alpha
//
//  Created by Vlad Lopes on 26/08/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var labelGroup: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var button23: UIButton!
    @IBOutlet weak var button24: UIButton!
    @IBOutlet weak var button25: UIButton!
    @IBOutlet weak var button26: UIButton!
    @IBOutlet weak var button27: UIButton!
    @IBOutlet weak var button28: UIButton!
    @IBOutlet weak var button29: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button31: UIButton!
    @IBOutlet weak var button32: UIButton!
    @IBOutlet weak var button33: UIButton!
 
    
    var group: Int!
    var letters: [String] = []
    var letter = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
        setButtons()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LetterSegue" {
            if let destination = segue.destination as? LetterViewController {
                destination.letter = letter
                destination.group = group
            }
        }
    }
    
    
    @IBAction func letterPressed(_ sender: UIButton) {
        letter = sender.titleLabel?.text ?? ""
        performSegue(withIdentifier: "LetterSegue", sender: nil)
    }
    
    @IBAction func playPressed(_ sender: UIButton) {
        letter = letters[0]
        performSegue(withIdentifier: "LetterSegue", sender: nil)
        
    }
    
    func setLabel() {
        let lines = groups[group].components(separatedBy: ":")
        labelGroup.text = lines[0]
        if lines.count == 2 {
            labelName.text = lines[1]
        }
    }
    
    func setButtons() {
        switch group {
        case 0:
            for i in group1 {
                letters.append(alphabet[i])
            }
          case 1:
              for i in group2 {
                  letters.append(alphabet[i])
              }
          case 2:
              for i in group3 {
                  letters.append(alphabet[i])
              }
          case 3:
              for i in group4 {
                  letters.append(alphabet[i])
              }
          case 4:
              for i in group5 {
                  letters.append(alphabet[i])
              }
          default:
               for x in alphabet {
                   letters.append(x)
               }
          }
        if letters.count <= 9 {
            button13.setTitle(letters[0], for: .normal)
            button13.isUserInteractionEnabled = true
            button14.setTitle(letters[1], for: .normal)
            button14.isUserInteractionEnabled = true
            button15.setTitle(letters[2], for: .normal)
            button15.isUserInteractionEnabled = true
            button16.setTitle(letters[3], for: .normal)
            button16.isUserInteractionEnabled = true
            button17.setTitle(letters[4], for: .normal)
            button17.isUserInteractionEnabled = true
            button18.setTitle(letters[5], for: .normal)
            button18.isUserInteractionEnabled = true
            if letters.count > 6 {
                
                button31.setTitle(letters[6], for: .normal)
                button31.isUserInteractionEnabled = true
                button32.setTitle(letters[7], for: .normal)
                button32.isUserInteractionEnabled = true
                button33.setTitle(letters[8], for: .normal)
                button33.isUserInteractionEnabled = true
                mainStack.subviews[0].isHidden = true
                mainStack.subviews[1].isHidden = true
                mainStack.subviews[3].isHidden = true
                mainStack.subviews[4].isHidden = true
            }
        } else {
            button1.setTitle(letters[0], for: .normal)
            button1.isUserInteractionEnabled = true
            button2.setTitle(letters[1], for: .normal)
            button2.isUserInteractionEnabled = true
            button3.setTitle(letters[2], for: .normal)
            button3.isUserInteractionEnabled = true
            button4.setTitle(letters[3], for: .normal)
            button4.isUserInteractionEnabled = true
            button5.setTitle(letters[4], for: .normal)
            button5.isUserInteractionEnabled = true
            button6.setTitle(letters[5], for: .normal)
            button6.isUserInteractionEnabled = true
            button7.setTitle(letters[6], for: .normal)
            button7.isUserInteractionEnabled = true
            button8.setTitle(letters[7], for: .normal)
            button8.isUserInteractionEnabled = true
            button9.setTitle(letters[8], for: .normal)
            button9.isUserInteractionEnabled = true
            button10.setTitle(letters[9], for: .normal)
            button10.isUserInteractionEnabled = true
            button11.setTitle(letters[10], for: .normal)
            button11.isUserInteractionEnabled = true
            button12.setTitle(letters[11], for: .normal)
            button12.isUserInteractionEnabled = true
            button13.setTitle(letters[12], for: .normal)
            button13.isUserInteractionEnabled = true
            button14.setTitle(letters[13], for: .normal)
            button14.isUserInteractionEnabled = true
            button15.setTitle(letters[14], for: .normal)
            button15.isUserInteractionEnabled = true
            button16.setTitle(letters[15], for: .normal)
            button16.isUserInteractionEnabled = true
            button17.setTitle(letters[16], for: .normal)
            button17.isUserInteractionEnabled = true
            button18.setTitle(letters[17], for: .normal)
            button18.isUserInteractionEnabled = true
            button19.setTitle(letters[18], for: .normal)
            button19.isUserInteractionEnabled = true
            button20.setTitle(letters[19], for: .normal)
            button20.isUserInteractionEnabled = true
            button21.setTitle(letters[20], for: .normal)
            button21.isUserInteractionEnabled = true
            button22.setTitle(letters[21], for: .normal)
            button22.isUserInteractionEnabled = true
            button23.setTitle(letters[22], for: .normal)
            button23.isUserInteractionEnabled = true
            button24.setTitle(letters[23], for: .normal)
            button24.isUserInteractionEnabled = true
            button25.setTitle(letters[24], for: .normal)
            button25.isUserInteractionEnabled = true
            button26.setTitle(letters[25], for: .normal)
            button26.isUserInteractionEnabled = true
            button27.setTitle(letters[26], for: .normal)
            button27.isUserInteractionEnabled = true
            button28.setTitle(letters[27], for: .normal)
            button28.isUserInteractionEnabled = true
            button29.setTitle(letters[28], for: .normal)
            button29.isUserInteractionEnabled = true
            button30.setTitle(letters[29], for: .normal)
            button30.isUserInteractionEnabled = true
            button31.setTitle(letters[30], for: .normal)
            button31.isUserInteractionEnabled = true
            button32.setTitle(letters[31], for: .normal)
            button32.isUserInteractionEnabled = true
            button33.setTitle(letters[32], for: .normal)
            button33.isUserInteractionEnabled = true
            
        }
    }

}
