//
//  SettingsViewController.swift
//  Prework-2
//
//  Created by Jack Scallan on 4/16/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }

    @IBAction func lightModeOn(_ sender: Any) {
        view.backgroundColor = .white
        Settings.sharedInstance.backgroundColor = .white
        Settings.sharedInstance.boxColor = .white
        Settings.sharedInstance.textColor = .black
        Settings.sharedInstance.segmentColor = UIColor.black
        Settings.sharedInstance.tint = .white
        Settings.sharedInstance.segmentTextColor = .black
        Settings.sharedInstance.segmentColor = .white
        tip1Label.textColor = .black
        tip2Label.textColor = .black
        tip3Label.textColor = .black
        tip1TextField.backgroundColor = .white
        tip2TextField.backgroundColor = .white
        tip3TextField.backgroundColor = .white
        tip1TextField.textColor = .black
        tip2TextField.textColor = .black
        tip3TextField.textColor = .black

    }
    
    @IBAction func darkModeOn(_ sender: Any) {
        let lightBlack = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        view.backgroundColor = lightBlack
        tip1Label.textColor = .white
        tip2Label.textColor = .white
        tip3Label.textColor = .white
        tip1TextField.backgroundColor = .darkGray
        tip2TextField.backgroundColor = .darkGray
        tip3TextField.backgroundColor = .darkGray
        tip1TextField.textColor = .white
        tip2TextField.textColor = .white
        tip3TextField.textColor = .white

        Settings.sharedInstance.backgroundColor = lightBlack
        Settings.sharedInstance.boxColor = .darkGray
        Settings.sharedInstance.textColor = .white
        Settings.sharedInstance.segmentColor = .white
        Settings.sharedInstance.tint = .darkGray
        Settings.sharedInstance.segmentTextColor = .white
        Settings.sharedInstance.segmentColor = .gray
        
        
    }
    
    
    
    @IBAction func confirmChanges(_ sender: Any) {
        Settings.sharedInstance.tip1 = tip1TextField.text!
        Settings.sharedInstance.tip2 = tip2TextField.text!
        Settings.sharedInstance.tip3 = tip3TextField.text!
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = Settings.sharedInstance.backgroundColor
    }
    

}


