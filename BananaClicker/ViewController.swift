//
//  ViewController.swift
//  BananaClicker
//
//  Created by PETER MICKLE on 9/24/24.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var moneyOutlet: UILabel!
    
    
    @IBOutlet weak var bananaOutlet: UILabel!
    
    var bananaState = 0
    var money = 0
    var bananas = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func clickAction(_ sender: UIButton) {
        if bananas > 0{
            if bananaState == 0{
                bananaState = 1
                let curImage = UIImage(named: "banana2")
                sender.setBackgroundImage(curImage, for: .normal)
            }else if bananaState == 1{
                bananaState = 2
                let curImage = UIImage(named: "banana3")
                sender.setBackgroundImage(curImage, for: .normal)
            }else if bananaState == 2{
                bananaState = 0
                let curImage = UIImage(named: "banana1")
                sender.setBackgroundImage(curImage, for: .normal)
                money += 1
                bananas -= 1
                moneyOutlet.text = "money: " + String(money)
                bananaOutlet.text = "bananas: " + String(bananas)
                if bananas == 0{
                    let curImage = UIImage(named: "outOfStock")
                    sender.setBackgroundImage(curImage, for: .normal)
                }
            }
        }

        
    }
    
    
}

