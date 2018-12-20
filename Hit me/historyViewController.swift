//
//  historyViewController.swift
//  Hit me
//
//  Created by chelsea lin on 2018/12/18.
//  Copyright © 2018 chelsea lin. All rights reserved.
//

import UIKit

class historyViewController: UIViewController {
    
    var history : [String] = []
    let historyKey = "HistoryKey"
    let userDefault = UserDefaults.standard
    
    @objc func backBarButton(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
//        print("123")
    }
    
//    let test = UIBarButtonItem(title: "test", style: .done, target: self, action: #selector(addTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    print(history.first ?? "new history is nil")
        history = userDefault.stringArray(forKey: historyKey) ?? []
        
//        print("123")
        
//        let test = UIBarButtonItem(title: "test", style: .done, target: self, action: #selector(historyViewController.addTapped))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backBarButton))
        
    
    }
    

}

extension historyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = history[indexPath.row]
        
        
        return cell!


    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
//
//
//    @IBAction func backButton(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//

//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
//                   forRowAtIndexPath indexPath: NSIndexPath) {
//
//        if (indexPath.row % 2 == 0)
//        {
//            cell.backgroundColor = UIColor.gray
//        }
//        else
//        {
//            cell.backgroundColor = UIColor.white
//        }
//    }
}
