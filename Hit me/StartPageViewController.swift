//
//  StartPageViewController.swift
//  Hit me
//
//  Created by chelsea lin on 2018/12/17.
//  Copyright © 2018 chelsea lin. All rights reserved.
//

import UIKit

class StartPageViewController: UIViewController {
    
    var coin = 500
    var history : [String] = []
    let userDefault = UserDefaults.standard
    let historyKey = "HistoryKey"
    
    @IBOutlet weak var coinsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 500 + P
        coinsLabel.text = "\(coin) P"
        
//        if let savedCoin = UserDefaults.standard.object(forKey: "coin") as? Int{
//
//            coin = savedCoin
//            coinsLabel.text = "\(coin) P"
//
//        }
//
//        if let savedHistory = UserDefaults.standard.object(forKey: "History") as? [String] {
//
//            history = savedHistory
//
//        }
        

    }
    

    @IBAction func start(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gamePage = storyBoard.instantiateViewController(withIdentifier: "gamepage")
        self.present(gamePage, animated: true)
        
        coin -= 10 
        coinsLabel.text = "\(coin) P"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        let record = formatter.string(from: Date())
        
        
        history.insert("\(record), \(coin)P", at: 0)
        userDefault.set(history, forKey: historyKey)
//        print("history inst \(history.first!)")

        
    }
    
    @IBAction func showHistory(_ sender: UIButton) {
        performSegue(withIdentifier: "HistorySegue", sender: sender)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as? historyViewController
//        print(history)
//        vc?.history = history
//        print(vc?.history ?? "vc.history is nil")
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let navVC = segue.destination as? UINavigationController
//
//        let tableVC = navVC?.viewControllers.first as! historyViewController
//
//        tableVC.history = history
//    }
    

}
