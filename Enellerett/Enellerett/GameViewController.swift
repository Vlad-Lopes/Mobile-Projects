//
//  GameViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 20/08/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    @IBOutlet weak var txtRight: UITextField!
    @IBOutlet weak var txtWrong: UITextField!
    @IBOutlet weak var lblWord: UILabel!    
    @IBOutlet var vwFundo: UIView!
    @IBOutlet weak var bttEnOut: UIButton!
    @IBOutlet weak var bttEttOut: UIButton!
    @IBOutlet weak var viTimer: UIView!
    
    var countRight = 0
    var countWrong = 0

    var tableEn: [String]!
    var tableEtt: [String]!
 
    var soundPlayer: AVAudioPlayer!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        txtRight.text = String(countRight)
        txtWrong.text = String(countWrong)
        bttEnOut.layer.cornerRadius = 7
        bttEttOut.layer.cornerRadius = 7
        
        playMusic()
        selectWord()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        startTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func playMusic() {
        if let url = Bundle.main.url(forResource: "myMusic", withExtension: "m4a")
           
        {
            do {
               self.soundPlayer = try AVAudioPlayer(contentsOf: url)
                self.soundPlayer.volume = 1
                self.soundPlayer.play()
                self.soundPlayer.numberOfLoops = -1
            } catch { 
                
            }
        }
    }
    func selectWord() {
        let rand1 = Int(arc4random_uniform(2))
        if rand1 == 0 {
            if tableEn.count >= 1 {
                let rand2 = Int(arc4random_uniform(UInt32(tableEn.count)))
                lblWord.text = tableEn[rand2]
            }
        }
        if rand1 == 1 {
            if tableEtt.count >= 1 {
                let rand2 = Int(arc4random_uniform(UInt32(tableEtt.count)))
                lblWord.text = tableEtt[rand2]
            }
        }
        viTimer.layer.removeAllAnimations()
        startTimer()
    }
    
    func startTimer() {
        viTimer.frame.size.width = 290
        UIView.animate(withDuration: 10.0, delay: 0.0, options: .curveLinear, animations: {self.viTimer.frame.size.width  = 0 ;
        }) { (finished) in
            if !finished {
                return }
            self.gameOver()
            }
    }
    
    func validateEn() {
        let word = lblWord.text
        if tableEn.contains(word!){
            vwFundo.backgroundColor = UIColor.green
            countRight += 1
            txtRight.text = String(countRight)
            
           
            
        } else {
            vwFundo.backgroundColor = UIColor.red
            countWrong += 1
            txtWrong.text = String(countWrong)
    
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            self.vwFundo.backgroundColor = UIColor(named: "myOrange")
            self.bttEnOut.backgroundColor = UIColor(named: "myBlue")
            self.selectWord()
        }
    }
    
    func validateEtt() {
        let word = lblWord.text
        if tableEtt.contains(word!){
             vwFundo.backgroundColor = UIColor.green
            countRight += 1
            txtRight.text = String(countRight)
            
            
        } else {
             vwFundo.backgroundColor = UIColor.red
            countWrong += 1
            txtWrong.text = String(countWrong)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            self.vwFundo.backgroundColor = UIColor(named: "myOrange")
            self.bttEnOut.backgroundColor = UIColor(named: "myBlue")
            self.bttEttOut.backgroundColor = UIColor(named: "myBlue")
            self.selectWord()
        }
    }
    
    func gameOver () {
        vwFundo.backgroundColor = UIColor.red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            
            self.vwFundo.backgroundColor = UIColor(named: "myOrange")
            self.bttEnOut.backgroundColor = UIColor(named: "myBlue")
            self.bttEttOut.backgroundColor = UIColor(named: "myBlue")
            self.countWrong += 1
            self.txtWrong.text = String(self.countWrong)
            self.selectWord()
        }
       
    }
        
    @IBAction func bttSound(_ sender: Any) {
        if soundPlayer.isPlaying {
            soundPlayer.stop()
        } else {
            soundPlayer.play()
        }
    }
    
    @IBAction func bttHome(_ sender: Any) {
        soundPlayer.stop()
        dismiss(animated: true, completion: nil)
    }
        
    @IBAction func bttEn(_ sender: UIButton) {
        bttEnOut.backgroundColor = UIColor.black
        validateEn()
    }
    
    @IBAction func bttEtt(_ sender: UIButton) {
        bttEttOut.backgroundColor = UIColor.black
        validateEtt()
        
    }
}
