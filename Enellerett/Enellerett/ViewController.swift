//
//  ViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 20/08/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var bttSpelaOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        bttSpelaOut.layer.cornerRadius = 7
        
        verifyOrdlista()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func verifyOrdlista() {
// verifica se arquivo pessoal ainda nao existe e cria um vazio
        var ordlistaURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        ordlistaURL = ordlistaURL?.appendingPathComponent("MyWords.json")
        guard NSData(contentsOf: ordlistaURL!) != nil else {
            let newMember = WordType(theme: "min ordlista", en: [], ett: [])
            let jsonEncoder = JSONEncoder()
            if let jsonData = try? jsonEncoder.encode(newMember) {
                do {
                    try jsonData.write(to: ordlistaURL!)
                } catch {
                    print ("erro atualizando arquivo json: \(error.localizedDescription)")
                }
            }
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bttSpela(_ sender: Any) {
        performSegue(withIdentifier: "seguePicker", sender: nil)
    }
    
    
    
}

