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
    static var defaults = UserDefaults.standard
    
    
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var moneyOutlet: UILabel!
    
    
    @IBOutlet weak var imageOutlet: UIButton!
    @IBOutlet weak var bananaOutlet: UILabel!
    
    @IBOutlet weak var multiOutlet: UILabel!
    
    
    var bananaState = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
       
        
        if !appData.defaults.bool(forKey: "start"){
            print("hi :)")
            appData.defaults.set(true, forKey: "start")
            appData.defaults.set(appData.bananas, forKey: "bananas")
            appData.defaults.set(appData.money, forKey: "money")
            appData.defaults.set(appData.multi, forKey: "multi")
            appData.bananas = appData.defaults.integer(forKey: "bananas")
            appData.money = appData.defaults.integer(forKey: "money")
            appData.multi = appData.defaults.integer(forKey: "multi")
        }

        
        appData.bananas = appData.defaults.integer(forKey: "bananas")
        appData.money = appData.defaults.integer(forKey: "money")
        appData.multi = appData.defaults.integer(forKey: "multi")
        
        if appData.bananas == 0{
            bananaState = 0
            let curImage = UIImage(named: "outOfStock")
            imageOutlet.setImage(curImage, for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        moneyOutlet.text = "money: " + String(appData.money)
        if appData.multi > 1{
            multiOutlet.isHidden = false
        }
        multiOutlet.text = "X" + String(appData.multi)
        bananaOutlet.text = "bananas: " + String(appData.bananas)
        if appData.bananas > 0{
            bananaState = 0
            let curImage = UIImage(named: "banana1")
            imageOutlet.setImage(curImage, for: .normal)
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
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        appData.defaults.set(appData.bananas, forKey: "bananas")
        appData.defaults.set(appData.money, forKey: "money")
        appData.defaults.set(appData.multi, forKey: "multi")
    }
    
    
}

