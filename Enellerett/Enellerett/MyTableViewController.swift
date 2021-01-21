//
//  MyTableViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 06/09/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var tableEn: [String] = []
    var tableEtt: [String] = []
    var completeTable: [String] = []
    var changeOrdlista = false
    var i = 0
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        completeTable.append(contentsOf: tableEn)
        completeTable.append(contentsOf: tableEtt)
        
        completeTable.sort()
       
        // Do any additional setup after loading the view.
    }
 /*
    override func viewWillAppear(_ animated: Bool) {
    
        tableView.reloadData()
    }
 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return completeTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCellTableViewCell
        
        cell.lblCell?.text = completeTable[indexPath.row]
        
        return cell
    }
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.completeTable.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    
        changeOrdlista = true
    }
    
    func saveOrdlista() {
// retira das tabelas originais as palavras excluidas
        print(completeTable,tableEn,tableEtt)
        i = 0
        while i < (tableEn.count) {
            if !completeTable .contains(tableEn[i]) {
                tableEn.remove(at: i)
                i -= 1
            }
            i += 1
        }

        i = 0
         while i < (tableEtt.count) {
            if !completeTable .contains(tableEtt[i]) {
                tableEtt.remove(at: i)
            }
            i += 1

        }
 // atualiza arquivo pessoal
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

}
