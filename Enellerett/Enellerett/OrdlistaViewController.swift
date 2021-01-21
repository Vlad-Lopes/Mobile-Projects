//
//  OrdlistaViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 03/09/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class OrdlistaViewController: UIViewController {

    @IBOutlet weak var txtNewWord: UITextField!
    
    var tableEn: [String] = []
    var tableEtt: [String] = []
    var myWords = WordType(theme: "", en: [], ett: [])
    var changeOrdlista = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OrdlistaViewController.hideKeyboard))
        self.view.addGestureRecognizer(tapView)

        // Do any additional setup after loading the view.
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            loadOrdlista()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func loadOrdlista() {
        var ordlistaURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        ordlistaURL = ordlistaURL?.appendingPathComponent("MyWords.json")
        
        let jsonMyData = try! Data(contentsOf: ordlistaURL!)
        do {
            let jsonDecoder = JSONDecoder()
            myWords = try! jsonDecoder.decode(WordType.self, from: jsonMyData)
            tableEn = []
            tableEtt = []
            tableEn.append(contentsOf: myWords.en)
            tableEtt.append(contentsOf: myWords.ett)
        }
    }
    
    func saveOrdlista() {
        let newMember = WordType(theme: "min ordlista", en: tableEn, ett: tableEtt)

        var ordlistaURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        ordlistaURL = ordlistaURL?.appendingPathComponent("MyWords.json")
    
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(newMember) {
            do {
                try jsonData.write(to: ordlistaURL!)
            } catch {
                print ("erro atualizando arquivo json: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func bttHome(_ sender: Any) {
        if changeOrdlista == true {
            saveOrdlista()
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bttEn(_ sender: Any) {
        if let word = txtNewWord.text {
            tableEn.append(word)
            txtNewWord.text = ""
            changeOrdlista = true
        }
    }
    
    @IBAction func bttEtt(_ sender: Any) {
        if let word = txtNewWord.text {
            tableEtt.append(word)
            txtNewWord.text = ""
            changeOrdlista = true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if changeOrdlista == true {
            saveOrdlista()
            loadOrdlista()
        }
        
        if let destinyView = segue.destination as? MyTableViewController {
            destinyView.tableEn.append(contentsOf: myWords.en)
            destinyView.tableEtt.append(contentsOf: myWords.ett)
        }
    }
    
    @IBAction func bttOrdlista(_ sender: Any) {
        performSegue(withIdentifier: "segueMyTable", sender: nil)
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
