//
//  ViewControllerShop.swift
//  BananaClicker
//
//  Created by PETER MICKLE on 9/26/24.
//

import UIKit



class ViewControllerShop: UIViewController {
    
    
    @IBOutlet weak var shopMoneyOutlet: UILabel!
    
    @IBOutlet weak var bananaBuyOutlet: UILabel!
    
    @IBOutlet weak var multiBuyOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bananaBuyOutlet.text = "10 bananas\nCost: 5"
        
        multiBuyOutlet.text = "Multiplier\nCost: 30"
        
        shopMoneyOutlet.text = "Money: " + String(appData.money)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func BananaBuyAction(_ sender: UIButton) {
        if appData.money >= 5{
            appData.money -= 5
            appData.bananas += 10
            shopMoneyOutlet.text = "Money: " + String(appData.money)
        }
        
    }
    
    
    @IBAction func multiBuyOutlet(_ sender: Any) {
        if appData.money >= 30{
            appData.money -= 30
            appData.multi += 1
            shopMoneyOutlet.text = "Money: " + String(appData.money)
        }
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
