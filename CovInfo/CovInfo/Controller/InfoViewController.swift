//
//  ViewController.swift
//  CovInfo
//
//  Created by Vlad Lopes on 05/04/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import UIKit
import CoreLocation

class InfoViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var confirmedlabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var seriousLabel: UILabel!
    @IBOutlet weak var newCasesLabel: UILabel!
    @IBOutlet weak var newDeathsLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var countryName = "Total Global"
    var infoManager = InfoManager()
    let formatter = NumberFormatter()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.locale = Locale(identifier: "br_BR")
        formatter.numberStyle = .decimal
        
        infoManager.delegate = self
        searchTextField.delegate = self
        
        infoManager.FetchInfo(country: "**")
        
    }
  
    @IBAction func worldPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        countryName = "Total Global"
        infoManager.FetchInfo(country: "**")
    }
    @IBAction func sharePressed(_ sender: UIButton) {
        UIGraphicsBeginImageContext(view.frame.size)
            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
        
            let items = [image]
            let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
            present(ac, animated: true)
    }
}

extension InfoViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        let name = searchTextField.text ?? "**"
        let country = CountryModel(inputValue: name)
        let initial = country.countryInitial
        countryName = country.countryName
        searchTextField.endEditing(true)
        infoManager.FetchInfo(country: initial)

      }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           searchTextField.endEditing(true)
       }
       
       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           if searchTextField.text != "" {
               return true
           } else {
               searchTextField.placeholder = "País ou Sigla"
               return false
           }
       }
       
       func textFieldDidEndEditing(_ textField: UITextField) {
           searchTextField.endEditing(true)
           searchTextField.text = ""
       }
    
    func screenShot() {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
    
        let items = [image]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
/*        let wsActivity = WhatsAppActivity()
               let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: [wsActivity])
               activityVC.excludedActivityTypes = [UIActivityTypeAirDrop, UIActivityTypeAddToReadingList,UIActivityTypeCopyToPasteboard,UIActivityTypeSaveToCameraRoll,UIActivityTypePrint]
               
               self.presentViewController(activityVC, animated: true, completion: nil)
 */
    }
}

extension InfoViewController: InfoManagerDelegate {
    
    func didUpdateInfo (info: InfoModel) {
        DispatchQueue.main.async {

            self.countryLabel.text = self.countryName
            self.confirmedlabel.text = self.formatter.string(from: NSNumber(value: info.confirmed))
            self.recoveredLabel.text = self.formatter.string(from: NSNumber(value: info.recovered))
            self.deathLabel.text = self.formatter.string(from: NSNumber(value: info.deaths))
            self.activeLabel.text = self.formatter.string(from: NSNumber(value: info.actives))
            self.seriousLabel.text = self.formatter.string(from: NSNumber(value: info.serious))
            self.newDeathsLabel.text = self.formatter.string(from: NSNumber(value: info.newDeaths))
            self.newCasesLabel.text = self.formatter.string(from: NSNumber(value: info.newCases))
           }
       }
       
    func didFailWithError(error: Error){
           print(error)
       }
}



