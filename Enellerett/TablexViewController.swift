//
//  TableViewController.swift
//  enellerett
//
//  Created by Sidney P'Silva on 05/09/18.
//  Copyright © 2018 Vlad Lopes. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet weak var tableEn: UITableView!
    @IBOutlet weak var tableEtt: UITableView!
    @IBOutlet weak var lblEn: UILabel!
    @IBOutlet weak var lblEtt: UILabel!
    
    var myTableEn: [String] = []
    var myTableEtt: [String] = []
    
    
    func tableView(tabelView: UITableView!, didSelectRowAtIndexpath indexPath: NSIndexPath!) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableEn.delegate = self as? UITableViewDelegate
        tableEn.dataSource = self as? UITableViewDataSource
        tableEtt.delegate = self as? UITableViewDelegate
        tableEtt.dataSource = self as? UITableViewDataSource
        
        self.tableEn.register(UITableViewCell.self, forCellReuseIdentifier: "cellEn")
        self.tableEtt.register(UITableViewCell.self, forCellReuseIdentifier: "cellEtt")
        
        self.tableEn.reloadData()
        self.tableEtt.reloadData()
        
        print("tabela En: \(myTableEn)")
        print("linhas \(myTableEn.count)")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableEn {
            return self.myTableEn.count
        } else {
            return self.myTableEtt.count
        }
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        if tableView == tableEn {
            var cellEn: CellEnViewCell = self.tableEn.dequeueReusableCell(withIdentifier: "cellEn", for: indexPath as IndexPath) as! CellEnViewCell
            cellEn.lblWordEn?.text = String(self.myTableEn[indexPath.row])
            return cellEn
        } else {
            var cellEtt: UITableViewCell = self.tableEn.dequeueReusableCell(withIdentifier: "cellEtt", for: indexPath as IndexPath)
            cellEtt.textLabel?.text = String(self.myTableEtt[indexPath.row])
            return cellEtt
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bttHome(_ sender: Any) {
        print("minha tabela \(tableEn)")
        dismiss(animated: true, completion: nil)
        
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
