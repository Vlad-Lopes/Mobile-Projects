//
//  PickerViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 20/08/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var themes: [String] = []
    var tableEn: [String] = []
    var tableEtt: [String] = []
    var themeSelect = ""
    var wordsFile: [WordType] = []
    var myWords = WordType(theme: "", en: [], ett: [])
    var didOrdlista = true

    // pickerView
    
    @IBOutlet weak var pckTheme: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pckTheme.delegate = self
        pckTheme.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           loadWords()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinyView = segue.destination as? GameViewController {
            destinyView.tableEn = tableEn
            destinyView.tableEtt = tableEtt
        }
    }
    
    func loadWords() {
        
        let wordsURL = Bundle.main.url(forResource: "Words", withExtension: "json")!
        var ordlistaURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            ordlistaURL = ordlistaURL?.appendingPathComponent("MyWords.json")
       
        let jsonData = try! Data(contentsOf: wordsURL)
        let jsonMyData = try! Data(contentsOf: ordlistaURL!)
        do {
            let jsonDecoder = JSONDecoder()
            wordsFile = try jsonDecoder.decode([WordType].self, from: jsonData)
            myWords = try! jsonDecoder.decode(WordType.self, from: jsonMyData)
        } catch {
            print("Erro decodificando arquivos json: \(error.localizedDescription)")
        }
        
        for i in 0...(wordsFile.count - 1){
            themes.append(wordsFile[i].theme)
        }
        themes.append(myWords.theme)
        themes.append("alla")
    }
    
    @IBAction func bttPlay(_ sender: Any) {
        didOrdlista = false
        themeSelect = themes[pckTheme.selectedRow(inComponent: 0)]
     
        tableEn = []
        tableEtt = []
        for i in 0...(wordsFile.count - 1){
            let themeFile = wordsFile[i].theme
            if themeSelect == themeFile || themeSelect == "alla" {
                tableEn.append(contentsOf: wordsFile[i].en)
                tableEtt.append(contentsOf: wordsFile[i].ett)
            }
        }

        if themeSelect == "min ordlista" || themeSelect == "alla" {
            tableEn.append(contentsOf: myWords.en)
            tableEtt.append(contentsOf: myWords.ett)
        
         }

        performSegue(withIdentifier: "segueGame", sender: nil)
    }
    
    @IBAction func bttWork(_ sender: Any) {
        didOrdlista = true
        performSegue(withIdentifier: "segueOrdlista", sender: nil)
    }
    @IBAction func bttInfo(_ sender: Any) {
        performSegue(withIdentifier: "segueInfo", sender: nil)
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
