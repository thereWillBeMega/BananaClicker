//
//  ViewController.swift
//  BananaClicker
//
//  Created by PETER MICKLE on 9/24/24.
//

import UIKit

class appData{
   static var money = 0
   static var bananas = 10
    static var multi = 1
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var moneyOutlet: UILabel!
    
    
    @IBOutlet weak var bananaOutlet: UILabel!
    
    var bananaState = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moneyOutlet.text = "money: " + String(appData.money)
        bananaOutlet.text = "bananas: " + String(appData.bananas)
        if appData.bananas > 0{
            bananaState = 0
            let curImage = UIImage(named: "banana1")
//            sender.setImage(curImage, for: .normal)
        }
    }


    @IBAction func clickAction(_ sender: UIButton) {
        if appData.bananas > 0{
            if bananaState == 0{
                bananaState = 1
                let curImage = UIImage(named: "banana2")
                sender.setImage(curImage, for: .normal)
            }else if bananaState == 1{
                bananaState = 2
                let curImage = UIImage(named: "banana3")
                sender.setImage(curImage, for: .normal)
            }else if bananaState == 2{
                bananaState = 0
                let curImage = UIImage(named: "banana1")
                sender.setImage(curImage, for: .normal)
                appData.money += 1 * appData.multi
                appData.bananas -= 1
                moneyOutlet.text = "money: " + String(appData.money)
                bananaOutlet.text = "bananas: " + String(appData.bananas)
                if appData.bananas == 0{
                    let curImage = UIImage(named: "outOfStock")
                    sender.setImage(curImage, for: .normal)
                }
            }
        }

        
    }
    
    
    @IBAction func shopAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Shop", sender: self)
    }
    
    
}

