//
//  ViewController.swift
//  Hit me
//
//  Created by chelsea lin on 2018/12/17.
//  Copyright © 2018 chelsea lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
   
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLable: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        button.layer.cornerRadius = 10
        
        startNewRound()
        
//        slider.transform = slider.transform.scaledBy(x: 1, y: 3)
//
//
    let targetImage = #imageLiteral(resourceName: "clipart1323676-1")
        slider.setThumbImage(targetImage, for: .normal)
    
    let targetImageDark = #imageLiteral(resourceName: "darkthumb")
        slider.setThumbImage(targetImageDark, for: .highlighted)
        
    let inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    let trackLeftImage = #imageLiteral(resourceName: "slider")
        let trackLeftResizeale = trackLeftImage.resizableImage(withCapInsets: inset)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
    
    let trackRightImage = #imageLiteral(resourceName: "slider-1")
        let trackRightResizeale = trackRightImage.resizableImage(withCapInsets: inset)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
        
        
    }

    @IBAction func exitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func backToFisrtPage(_ sender: UIStoryboardSegue){
//        if sender.identifier == "exit" {
//            print("finish")
//        }
////        if 
//    }

    @IBAction func HitMeButton() {
        
    let title: String
        if targetValue == currentValue {
        title = "You Win🥳🥳!!!"
        } else {
        title = "💩💩💩You Lose💩💩💩"
        }
        
    let messages = " Your score is \(currentValue)"

    
    let alert = UIAlertController(title: title , message: messages, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "GO!", style: .default, handler: nil)
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
        
        
    }

    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        _ = slider.value.rounded()
        currentValue = Int(slider.value)
        
    
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updatedValue()
    
    }
    
    func updatedValue() {
        targetLable.text = String(targetValue)
        
    }
    

    
        
}

