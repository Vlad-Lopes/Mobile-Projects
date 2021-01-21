//
//  CustomViewController.swift
//  Mairipora
//
//  Created by ADMIN on 14/05/16.
//  Copyright © 2016 Octa. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {

   
    @IBOutlet weak var bttPrincesa: UIButton!
    
    @IBOutlet weak var bttSeletivo: UIButton!
    
    @IBOutlet weak var bttParada: UIButton!
   
    @IBOutlet weak var bttIntermediario: UIButton!
    
    @IBOutlet weak var bttDivisa: UIButton!
    
    @IBOutlet weak var bttPedra: UIButton!
    
    @IBOutlet weak var bttFranco: UIButton!
    
    @IBOutlet weak var bttNazare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bttSeletivo.titleLabel!.textAlignment = NSTextAlignment.center
    
        bttPrincesa.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttParada.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttIntermediario.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttDivisa.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttPedra.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttFranco.titleLabel!.textAlignment = NSTextAlignment.center
        
        bttNazare.titleLabel!.textAlignment = NSTextAlignment.center
     
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSeletivo" {
            if let destination = segue.destination as? TabelaViewController {
               destination.linha = 1
            }
        }
        if segue.identifier == "seguePrincesa" {
            if let destination = segue.destination as? TabelaViewController {
                    destination.linha = 2
                }
        }
        if segue.identifier == "segueParada" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 3
            }
        }
        if segue.identifier == "segueIntermediario" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 4
            }
        }
        if segue.identifier == "segueDivisa" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 5
            }
        }
        if segue.identifier == "seguePedra" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 6
            }
        }
        if segue.identifier == "segueFranco" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 7
            }
        }
        if segue.identifier == "segueNazare" {
            if let destination = segue.destination as? TabelaViewController {
                destination.linha = 8
            }
        }
    }
}
