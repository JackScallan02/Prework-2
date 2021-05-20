//
//  SettingsViewController.swift
//  Prework-2
//
//  Created by Jack Scallan on 4/16/21.
//

import UIKit

protocol DataDelegate {
    func sendTips(tips: [String?])
    func lightMode(mode: Bool)
}

class SettingsViewController: UIViewController {
    
    var delegate:DataDelegate?
    var lightMode:DataDelegate?
    
    var light = true
    var dark = false
        
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    @IBOutlet weak var redMessageLabel: UILabel!
    @IBOutlet weak var greenMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    
    func LD_On(on: Bool) {
        if on == true {
            lightModeOn(Any.self)
            print("here1")
        } else {
            darkModeOn(Any.self)
            print("here2")
        }
    }
    

    @IBAction func lightModeOn(_ sender: Any) {
        
        self.delegate?.lightMode(mode: true)
            
        view.backgroundColor = .white
        tip1Label.textColor = .black
        tip2Label.textColor = .black
        tip3Label.textColor = .black
        tip1TextField.backgroundColor = .white
        tip2TextField.backgroundColor = .white
        tip3TextField.backgroundColor = .white
        tip1TextField.textColor = .black
        tip2TextField.textColor = .black
        tip3TextField.textColor = .black
        
        LD_Mode.sharedInstance.lightMode = true
    }
    
    
    @IBAction func darkModeOn(_ sender: Any) {
        
        self.delegate?.lightMode(mode: false)
            
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
        
        LD_Mode.sharedInstance.lightMode = false
        
        

    }
    
    
    @IBAction func confirmChanges(_ sender: Any) {

        let tip1 = tip1TextField.text
        let tip2 = tip2TextField.text
        let tip3 = tip3TextField.text
        
        let dataToSend = [tip1, tip2, tip3]
        self.delegate?.sendTips(tips: dataToSend)
        
        
        redMessageLabel.isHidden = true
        greenMessageLabel.isHidden = false
        
        tip1TextField.text = ""
        tip2TextField.text = ""
        tip3TextField.text = ""
        
        tip1TextField.becomeFirstResponder()
        dismissKeyboard()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.greenMessageLabel.isHidden = true
        }
    }
    
    
    
    @IBAction func tip1TextFieldChanged(_ sender: Any) {
        textFieldChanged()
    }
    
    @IBAction func tip2TextFieldChanged(_ sender: Any) {
        textFieldChanged()
    }
    
    @IBAction func tip3TextFieldChanged(_ sender: Any) {
        textFieldChanged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if LD_Mode.sharedInstance.lightMode == true {
            lightModeOn(Any.self)
        } else {
            darkModeOn(Any.self)
        }
    }
    
    
    func textFieldChanged() {
        redMessageLabel.isHidden = false
        if allFieldsEmpty() {
            redMessageLabel.isHidden = true
        }
    }
    
    
    func allFieldsEmpty() -> Bool {
        if tip1TextField.text == "" && tip2TextField.text == "" && tip3TextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}


class LD_Mode {
    static let sharedInstance = LD_Mode()
    var lightMode = true
}


