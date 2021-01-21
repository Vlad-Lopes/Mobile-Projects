//
//  LinhasViewController.swift
//  Mairipora
//
//  Created by ADMIN on 21/05/16.
//  Copyright © 2016 Octa. All rights reserved.
//

import UIKit

class LinhasViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tblLinhaMunicipal: UITableView!

     
    let tabLinhas = ["Apolinário", "Barreiro", "Boa Vista", "Cacéia", "Capim Branco", "Capoavinha", "Cinco Lagos", "Guavirutuva", "Hortolândia", "Jardim da Lagoa", "Marmelo", "Mato Dentro", "Pedra Vermelha", "Pedreira", "Petrópolis – Alpes", "Petrópolis – Sausalito", "Prainha", "Remédio", "Rio Acima", "Sabesp", "São Vicente", "Terra Preta"]

        
        
        /*"Barreiro", "Boa Vista","Caceia","Capim Branco","Capoavinha","Cinco Lagos","Guavirutuva","Hortolândia","Jardim da Lagoa","Jd. da Lagoa","Marmelo","Mato Dentro","Nazaré Paulista","Pedra Vermelha","Pedreira","Petrópolis / Alpes","Petrópolis / Circular","Petrópolis / Curva da Macumba","Petrópolis / Pinheiral","Petrópolis / Sausalito","Pinheiral","Prainha","Remédio","Rio Acima","Sabesp","São Vicente","Terra Preta"]
    
  */
    var vermelho: CGFloat = CGFloat(0.5)
    var verde: CGFloat = CGFloat(0.5)
    var azul: CGFloat = CGFloat(0.5)
    

    var corDaLinha: UIColor? // = colorWithHexString(self("#be1337"))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   nvgLinhas.title = "Linhas Municipais"
     //   let navBackgroundImage:UIImage! = UIImage(named: "top 2.imageset/top 2.jpg")
        
     //   [UINavigationBar .appearance().setBackgroundImage(navBackgroundImage, forBarMetrics:.Default)]
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "segueMunicipal" {
            let linhaMunicipal = segue.destination as! MunicipalViewController
        
            let indicelinha = tblLinhaMunicipal.indexPath(for: sender as! UITableViewCell) as IndexPath?
        
            linhaMunicipal.nomeDaLinha = tabLinhas[indicelinha!.row]
            
        }
    
        
        /* if segue.identifier == "segueMunicipal" {
           let indiceLinha = tblLinhaMunicipal.indexPathForCell(sender as! UITableViewCell) as NSIndexPath?
        
            if let destination = segue.destinationViewController as? MunicipalViewController {
                destination.numeroDaLinha = linhaMunicipal
                destination.lblNomeLinha.text = tabLinhas[indiceLinha!.row]
                 destination.numeroDaLinha = Int(tabLinhas[indiceLinha!.row])!
               destination.numeroDaLinha = 4
          
            }
        } */
    }
    
   /* override func viewDidAppear(animated: Bool) {
        // 1
        var nav = self.navigationController?.navigationBar
        // 2
        //nav?.barStyle = UIBarStyle.BlackTranslucent
        //nav?.tintColor = UIColor.whiteColor()
        // 3
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.contentMode = .ScaleAspectFit
        // 4
        let image = UIImage(named: "Top 2")
        imageView.image = image
        // 5
        //nvgLinhas.titleView = imageView
        navigationItem.titleView = imageView
        navigationItem.title = "Linhas Municipais"
    }
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinhaCell", for: indexPath) as! LinhasTableViewCell
        
        cell.lblLinhaMunicipal.text = tabLinhas[indexPath.row]
    
        let indice = indexPath.row
        
        if indice == 0 || indice == 8 || indice == 16 {
            corDaLinha = colorWithHexString("4db23b")}
        else if indice == 1 || indice == 9 || indice == 17 {
            corDaLinha = colorWithHexString("6246a6")}
        else if indice == 2 || indice == 10 || indice == 18 {
            corDaLinha = colorWithHexString("e3991d")}
        else if indice == 3 || indice == 11 || indice == 19 {
            corDaLinha = colorWithHexString("ca5252")}
        else if indice == 4 || indice == 12 || indice == 20 {
            corDaLinha = colorWithHexString("e31ddc")}
        else if indice == 5 || indice == 13 || indice == 21 {
            corDaLinha = colorWithHexString("dce31d")}
        else if indice == 6 || indice == 14 || indice == 22 {
            corDaLinha = colorWithHexString("1569d1")}
        else if indice == 7 || indice == 15 || indice == 23 {
            corDaLinha = colorWithHexString("e3391d")}
        
        cell.lblLinhaMunicipal.backgroundColor = corDaLinha
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return tabLinhas.count
        
    }
    
         
    func colorWithHexString (_ hex:String) -> UIColor {
    //    let cString:String =
    //    hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercased()
        let cString =
            hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
      //  if (cString.hasPrefix("#")) {
      //      cString = (cString as NSString).substringFromIndex(1)
      //  }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
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
