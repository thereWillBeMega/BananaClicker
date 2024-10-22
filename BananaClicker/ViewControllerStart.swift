//
//  ViewControllerStart.swift
//  BananaClicker
//
//  Created by PETER MICKLE on 10/22/24.
//

import UIKit

class ViewControllerStart: UIViewController {
    
    
    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    var naming = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if appData.defaults.string(forKey: "name") != ""{
            nameOutlet.text = "Hello, \(appData.defaults.string(forKey: "name")!)!"
        }else{
            nameOutlet.text = "Hello"
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nameAction(_ sender: UIButton) {
        if !naming{
            naming = true
            textFieldOutlet.isHidden = false
            sender.setTitle("Conform", for: .normal)
        }else {
            naming = false
            textFieldOutlet.isHidden = true
            sender.setTitle("Set Name", for: .normal)
            appData.defaults.set(textFieldOutlet.text, forKey: "name")
            
            if appData.defaults.string(forKey: "name") != ""{
                nameOutlet.text = "Hello, \(appData.defaults.string(forKey: "name")!)!"
            }else{
                nameOutlet.text = "Hello"
            }
        }
        
        
    }
    
    
    @IBAction func continueAction(_ sender: Any) {
        performSegue(withIdentifier: "ToGameStart", sender: self)
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
