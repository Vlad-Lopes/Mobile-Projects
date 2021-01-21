//
//  TabelaViewController.swift
//  Mairipora
//
//  Created by ADMIN on 17/05/16.
//  Copyright © 2016 Octa. All rights reserved.
//

import UIKit

class TabelaViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var lblIdentificaLinha: UILabel!
    
    @IBOutlet weak var vwPropaganda: UIImageView!
    
    var linha = 0
    var contador = 0
    var dia = "Seg"
   
    var tieteIdaSeg = ["04:50", "05:15", "05:40*", "05:45", "06:00*", "06:10", "06:20", "06:40", "06:50", "07:00*", "07:15", "07:30", "07:45", "08:30", "09:00", "09:30", "10:15", "11:30", "12:15", "13:30", "15:00", "15:30", "16:00", "17:25*", "17:30", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "23:00", "* Terra Preta", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    var tieteVoltaSeg = ["06:00", "06:15**", "06:30", "06:50**", "07:50**", "08:15", "08:45**", "09:00", "09:30", "10:00**", "10:30", "11:00**", "11:30", "12:00**", "12:30", "13:15**", "13:45", "14:15", "14:45**", "15:30*", "16:00**", "16:30", "17:00**", "17:15", "17:30*", "17:45**", "18:00*", "18:15**", "18:30*", "18:45**", "19:00", "19:15**", "19:30*", "19:45**", "20:00", "20:20**", "20:40", "21:00**", "21:30", "22:00**", "22:40", "22:55**", "23:00*", "23:05*", "23:15**", "00:00*", "* Terra Preta", "** Chico Pontes", ""]
    var tieteIdaSab = ["05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "11:30", "12:00", "13:00", "13:30", "14:00", "15:00", "15:30", "16:00", "17:15", "19:00", "20:00", "21:00", "22:00", "23:00", "", "", "", "", "", "", "", "", "", "", "", ""]
    var tieteVoltaSab = ["06:00**", "06:45", "07:00**", "07:45", "08:00**", "08:45", "09:00**", "09:45", "10:00**", "10:45", "11:00**", "11:45", "12:00**", "12:30**", "13:00**", "13:45", "14:00**", "14:30**", "15:00**", "15:45", "16:00**", "16:30**", "17:00**", "17:45", "18:30**", "19:45", "20:00**", "21:00", "22:00**", "23:00", "00:00*", "* terra Preta", "** Chico Pontes"]
    var tieteIdaDom = ["05:00", "07:00", "09:00", "11:00", "13:00", "15:00", "17:00", "19:00", "20:00", "21:30", "23:00", "", "", "", "", "", "", "", "", ""]
    var tieteVoltaDom = ["06:00", "07:15", "08:00**", "09:15", "10:00**", "11:15", "12:00**", "13:15", "14:00**", "15:15", "16:00**", "17:15", "18:00**", "19:15", "20:00**", "21:00**", "22:30", "00:00*", "* terra Preta", "** Chico Pontes"]
    
 
    var princesaIdaSeg = ["05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "10:45", "12:45", "14:15", "16:45", "18:05"]
    var princesaVoltaSeg = ["07:15", "17:45", "", "", "", "", "", "", "", "", "", ""]
    var princesaIdaSab = ["05:30", "06:30", "07:30", "08:30", "09:30", "10:30", "12:30", "16:30", "17:30", "18:00"]
    var princesaVoltaSab = ["", "", "", "", "", "", "", "", "", ""]
    var princesaIdaDom = ["06:00", "08:00", "10:00", "12:00", "14:00", "16:00", "18:00"]
    var princesaVoltaDom = ["", "", "", "", "", "", ""]
    
  
    var paradaIdaSeg = ["05:30", "06:15", "06:30", "07:30", "08:30", "09:30", "10:30", "12:00", "13:00", "14:30", "15:30", "16:30", "17:30", "18:30", "19:30"]
    var paradaVoltaSeg = ["06:30", "07:30", "08:30", "09:30", "10:45", "11:45", "13:00", "14:00", "15:30", "16:30", "17:30", "18:30", "19:30", "20:30", ""]
    var paradaIdaDom = ["Não circula"]
    var paradaVoltaDom = ["aos Domingos"]

   
    var intermediarioIdaSeg = ["04:30", "05:10", "05:30", "05:45", "06:00", "06:15", "06:30", "06:45", "06:50", "07:00", "07:15", "07:45", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "14:45", "15:00", "15:15", "16:00", "16:15", "16:30", "16:45", "17:00", "17:30", "18:00", "18:30", "19:30", "20:30", "21:30"]
    var intermediarioVoltaSeg = ["07:40", "08:40", "09:20", "10:00", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", " "]
    var intermediarioIdaSab = ["04:30", "05:30", "06:00", "06:15", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "18:00", "18:30", "19:30", "20:30", "21:30"]
    var intermediarioVoltaSab = ["ver Divisa", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    var intermediarioIdaDom = ["04:45", "05:30", "06:00", "06:15", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:30", "21:30"]
    var intermediarioVoltaDom = ["ver Divisa", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    
    var divisaIdaSeg = ["04:00", "04:40", "05:00", "05:15", "05:45", "06:00", "06:15", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "19:00", "20:00", "21:00", "", "", "", ""]
    var divisaVoltaSeg = ["05:45", "06:15", "06:40", "07:00", "07:20", "08:00", "08:20", "09:00", "09:40", "10:20", "10:40", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", "17:30", "17:45", "18:00", "18:20", "18:40", "19:00", "19:30", "20:15", "21:00", "22:00", "23:00"]
    var divisaIdaSab = ["04:15", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "19:00", "20:00", "21:00", ""]
    var divisaVoltaSab = ["06:00", "06:40", "07:10", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:15", "21:00", "22:00", "23:00"]
    var divisaIdaDom = ["04:15", "05:00", "05:30", "06:00", "06:30", "07:00", "07:40", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "20:00", "21:00", ""]
    var divisaVoltaDom = ["06:00", "06:40", "07:10", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "22:00", "23:00"]
    
   
    var pedraIdaSeg = ["05:15", "06:00", "09:00", "11:30", "12:00*", "14:00", "16:30", "18:00*", "19:00", "*"]
    var pedraVoltaSeg = ["06:15", "07:30", "10:00", "12:30", "15:00", "17:50", "19:00", "20:00", "", "Clube dos Médicos"]
    var pedraIdaSab = ["06:00", "09:00", "11:30", "14:00", "16:30", "19:00"]
    var pedraVoltaSab = ["07:30", "10:00", "12:30", "15:00", "17:30", "20:00"]
    var pedraIdaDom = ["08:00", "12:00", "16:00"]
    var pedraVoltaDom = ["09:00", "13:00", "17:00"]
    
    
    var francoIdaSeg = ["04:40", "05:20", "05:40", "06:00", "06:20", "06:40", "07:00", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20", "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40", "13:00", "13:20", "13:40", "14:00", "14:20", "14:40", "15:00", "15:20", "15:40", "16:00", "16:20", "16:40", "17:00", "17:20", "17:40", "18:00", "18:20", "18:40", "19:00", "19:20", "19:40", "20:00", "20:30", "21:00", "22:00", "23:30"]
    var francoVoltaSeg = ["05:20", "06:00", "06:20", "06:40", "07:00", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20", "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40", "13:00", "13:20", "13:40", "14:00", "14:20", "14:40", "15:00", "15:20", "15:40", "16:00", "16:20", "16:40", "17:00", "17:20", "17:40", "18:00", "18:20", "18:40", "19:00", "19:20", "19:40", "20:00", "20:30", "21:00", "21:30", "22:20", "23:10", "00:00"]
    var francoIdaSab = ["05:00", "05:20", "05:40", "06:00", "06:20", "06:40", "07:00", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20", "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40", "13:00", "13:20", "13:40", "14:00", "14:20", "14:40", "15:00", "15:20", "15:40", "16:00", "16:20", "16:40", "17:00", "17:20", "17:40", "18:00", "18:20", "18:40", "19:00", "19:20", "19:40", "20:00", "20:30", "21:00", "22:00"]
    var francoVoltaSab = ["05:30", "06:00", "06:20", "06:40", "07:00", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20", "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40", "13:00", "13:20", "13:40", "14:00", "14:20", "14:40", "15:00", "15:20", "15:40", "16:00", "16:20", "16:40", "17:00", "17:20", "17:40", "18:00", "18:20", "18:40", "19:00", "19:20", "19:40", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30"]
    var francoIdaDom = ["05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:45", "19:30", "20:30", "22:00"]
    var francoVoltaDom = ["05:30", "06:00", "06:30", "07:00", "07:40", "08:15", "08:45", "09:15", "09:45", "10:15", "10:45", "11:15", "11:45", "12:15", "12:45", "13:15", "13:45", "14:15", "14:45", "15:15", "15:45", "16:15", "16:45", "17:15", "17:45", "18:15", "18:45", "19:30", "20:15", "21:00", "22:30"]
    
    
    var nazareIdaSeg = ["07:30", "14:20"]
    var nazareVoltaSeg = ["08:20", "15:45"]
    var nazareIdaSab = ["07:30", "14:00"]
    var nazareVoltaSab = ["08:45", "15:15"]
    var nazareIdaDom = ["Não circula", ""]
    var nazareVoltaDom = ["aos Domingos", ""]
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        switch linha {
        case 1:
           lblIdentificaLinha.text = "Tietê Seletivo"
        
        case 2:
           lblIdentificaLinha.text = "Princesa Isabel"
        
        case 3:
            lblIdentificaLinha.text = "Parada Inglesa"
            
        case 4:
            lblIdentificaLinha.text = "Tietê Intermediário"
        
        case 5:
            lblIdentificaLinha.text = "Divisa Intermediário"
            
        case 6:
            lblIdentificaLinha.text = "Pedra Branca"
        
        case 7:
            lblIdentificaLinha.text = "Franco da Rocha"
            
        case 8:
            lblIdentificaLinha.text = "Nazaré Paulista"
            
        default:
            lblIdentificaLinha.text = ""
        }
        
        vwPropaganda.image = (UIImage(named: "Anuncie.jpg"))
        delay(3.0) {
            self.vwPropaganda.image = (UIImage(named: "vlad lopes.jpg"))
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
       
        switch linha {
        case 1:
             if dia == "Seg" {
                cell.lblIda.text = tieteIdaSeg[indexPath.row]
                cell.lblVolta.text = tieteVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = tieteIdaSab[indexPath.row]
                cell.lblVolta.text = tieteVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = tieteIdaDom[indexPath.row]
                cell.lblVolta.text = tieteVoltaDom[indexPath.row]
            }
        case 2:
            if dia == "Seg" {
                cell.lblIda.text = princesaIdaSeg[indexPath.row]
                cell.lblVolta.text = princesaVoltaSeg[indexPath.row]
            }
                if dia == "Sab" {
                cell.lblIda.text = princesaIdaSab[indexPath.row]
                cell.lblVolta.text = princesaVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = princesaIdaDom[indexPath.row]
                cell.lblVolta.text = princesaVoltaDom[indexPath.row]
            }
        case 3:
            if dia == "Seg"  || dia == "Sab"{
                cell.lblIda.text = paradaIdaSeg[indexPath.row]
                cell.lblVolta.text = paradaVoltaSeg[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = paradaIdaDom[indexPath.row]
                cell.lblVolta.text = paradaVoltaDom[indexPath.row]
            }
        case 4:
            if dia == "Seg" {
                cell.lblIda.text = intermediarioIdaSeg[indexPath.row]
                cell.lblVolta.text = intermediarioVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = intermediarioIdaSab[indexPath.row]
                cell.lblVolta.text = intermediarioVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = intermediarioIdaDom[indexPath.row]
                cell.lblVolta.text = intermediarioVoltaDom[indexPath.row]
            }
        case 5:
            if dia == "Seg" {
                cell.lblIda.text = divisaIdaSeg[indexPath.row]
                cell.lblVolta.text = divisaVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = divisaIdaSab[indexPath.row]
                cell.lblVolta.text = divisaVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = divisaIdaDom[indexPath.row]
                cell.lblVolta.text = divisaVoltaDom[indexPath.row]
            }
        case 6:
            if dia == "Seg" {
                cell.lblIda.text = pedraIdaSeg[indexPath.row]
                cell.lblVolta.text = pedraVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = pedraIdaSab[indexPath.row]
                cell.lblVolta.text = pedraVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = pedraIdaDom[indexPath.row]
                cell.lblVolta.text = pedraVoltaDom[indexPath.row]
                }
        case 7:
            if dia == "Seg" {
                cell.lblIda.text = francoIdaSeg[indexPath.row]
                cell.lblVolta.text = francoVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = francoIdaSab[indexPath.row]
                cell.lblVolta.text = francoVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = francoIdaDom[indexPath.row]
                cell.lblVolta.text = francoVoltaDom[indexPath.row]
            }
        case 8:
            if dia == "Seg" {
                cell.lblIda.text = nazareIdaSeg[indexPath.row]
                cell.lblVolta.text = nazareVoltaSeg[indexPath.row]
            }
            if dia == "Sab" {
                cell.lblIda.text = nazareIdaSab[indexPath.row]
                cell.lblVolta.text = nazareVoltaSab[indexPath.row]
            }
            if dia == "Dom" {
                cell.lblIda.text = nazareIdaDom[indexPath.row]
                cell.lblVolta.text = nazareVoltaDom[indexPath.row]}
      
        default:
            cell.lblIda.text = "00:00"
            cell.lblVolta.text = "00:00"
        }
        return cell
    }
    
    @IBOutlet weak var tblHora: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        switch linha {
        case 1:
            if dia == "Seg" {
                contador = tieteIdaSeg.count}
            else if dia == "Sab" {
                contador = tieteIdaSab.count}
            else if dia == "Dom" {
                contador = tieteIdaDom.count}
        case 2:
            if dia == "Seg" {
                contador = princesaIdaSeg.count}
            else if dia == "Sab" {
                contador = princesaIdaSab.count}
            else if dia == "Dom" {
                contador = princesaIdaDom.count}
        case 3:
            if dia == "Seg" || dia == "Sab"{
                contador = paradaIdaSeg.count}
            else if dia == "Dom" {
                contador = paradaIdaDom.count}
        case 4:
            if dia == "Seg" {
                contador = intermediarioIdaSeg.count}
            else if dia == "Sab" {
                contador = intermediarioIdaSab.count}
            else if dia == "Dom" {
                contador = intermediarioIdaDom.count}
        case 5:
            if dia == "Seg" {
                contador = divisaIdaSeg.count}
            else if dia == "Sab" {
                contador = divisaIdaSab.count}
            else if dia == "Dom" {
                contador = divisaIdaDom.count}
        case 6:
            if dia == "Seg" {
                contador = pedraIdaSeg.count}
            else if dia == "Sab" {
                contador = pedraIdaSab.count}
            else if dia == "Dom" {
                contador = pedraIdaDom.count}
        case 7:
            if dia == "Seg" {
                contador = francoIdaSeg.count}
            else if dia == "Sab" {
                contador = francoIdaSab.count}
            else if dia == "Dom" {
                contador = francoIdaDom.count}
        case 8:
            if dia == "Seg" {
                contador = nazareIdaSeg.count}
            else if dia == "Sab" {
                contador = nazareIdaSab.count}
            else if dia == "Dom" {
                contador = nazareIdaDom.count}
        default:
            contador = 0
        }
        return contador
    }
    

    
    @IBAction func sgcDiaDaSemana(_ sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex) {
        case 0:
            dia = "Seg"
        case 1:
            dia = "Sab"
        case 2:
            dia = "Dom"
        default:
            dia = ""
          
        }
        tblHora.reloadData()
    }
    
    func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
                       execute: closure )
    }

         /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
