//
//  ViewController.swift
//  Prework-2
//
//  Created by Jack Scallan on 4/16/21.
//

import UIKit

class ViewController: UIViewController, DataDelegate {
    
    var tipValues: [Float] = [15, 20, 25]
        
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        billAmountTextField.becomeFirstResponder()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func sendTips(tips: [String?]) {
        
        let tip1String = tips[0]!
        let tip1Float = Float(tip1String) ?? 15
        let tip2String = tips[1]!
        let tip2Float = Float(tip2String) ?? 20
        let tip3String = tips[2]!
        let tip3Float = Float(tip3String) ?? 25
        
        tipValues = [tip1Float, tip2Float, tip3Float]
        
        let tip1 = String(format: "%.2f%%", tip1Float)
        let tip2 = String(format: "%.2f%%", tip2Float)
        let tip3 = String(format: "%.2f%%", tip3Float)
        
        
        tipControl.setTitle(tip1, forSegmentAt: 0)
        tipControl.setTitle(tip2, forSegmentAt: 1)
        tipControl.setTitle(tip3, forSegmentAt: 2)
        
    }
    
    
    func lightMode(mode: Bool) {
        let lightBlack = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0)
        
        if mode == false { //dark mode
            view.backgroundColor = lightBlack
            billAmountTextField.textColor = .white
            billAmountTextField.backgroundColor = .darkGray
            tipAmountLabel.textColor = .white
            totalLabel.textColor = .white
            billAmountTextLabel.textColor = .white
            tipTextLabel.textColor = .white
            totalTextLabel.textColor = .white
            
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                tipControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
            tipControl.selectedSegmentTintColor = .darkGray
            
            LD_Mode.sharedInstance.lightMode = false
            
        } else { //light mode
            view.backgroundColor = .white
            billAmountTextField.textColor = .black
            billAmountTextField.backgroundColor = .white
            tipAmountLabel.textColor = .black
            totalLabel.textColor = .black
            billAmountTextLabel.textColor = .black
            tipTextLabel.textColor = .black
            totalTextLabel.textColor = .black
            
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
                tipControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
            tipControl.selectedSegmentTintColor = .white
            
            LD_Mode.sharedInstance.lightMode = true
        }
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Float(billAmountTextField.text!) ?? 0
        
        let tip1 = tipValues[0] / 100
        let tip2 = tipValues[1] / 100
        let tip3 = tipValues[2] / 100
        
        let tipPercentages = [tip1, tip2, tip3]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC: SettingsViewController = segue.destination as! SettingsViewController
        secondVC.delegate = self
        
    }

    
    @IBAction func typeInBillAmountField(_ sender: Any) {
        calculateTip(sender)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        billAmountTextField.becomeFirstResponder()

    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
