//
//  SettingsViewController.swift
//  Prework-2
//
//  Created by Jack Scallan on 4/16/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
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

    }
    
    @IBAction func darkModeOn(_ sender: Any) {
        let lightBlack = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        view.backgroundColor = lightBlack
        Settings.sharedInstance.backgroundColor = lightBlack
        Settings.sharedInstance.boxColor = .darkGray
        Settings.sharedInstance.textColor = .white
        Settings.sharedInstance.segmentColor = .white
        Settings.sharedInstance.tint = .darkGray
        Settings.sharedInstance.segmentTextColor = .white
        Settings.sharedInstance.segmentColor = .gray
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = Settings.sharedInstance.backgroundColor
    }
    

}


