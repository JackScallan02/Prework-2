//
//  ViewController.swift
//  Prework-2
//
//  Created by Jack Scallan on 4/16/21.
//

import UIKit

class ViewController: UIViewController {

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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = Settings.sharedInstance.backgroundColor
        billAmountTextField.textColor =
            Settings.sharedInstance.textColor
        billAmountTextField.backgroundColor = Settings.sharedInstance.boxColor
        tipAmountLabel.textColor = Settings.sharedInstance.textColor
        totalLabel.textColor = Settings.sharedInstance.textColor
        billAmountTextLabel.textColor = Settings.sharedInstance.textColor
        tipTextLabel.textColor = Settings.sharedInstance.textColor
        totalTextLabel.textColor = Settings.sharedInstance.textColor
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: Settings.sharedInstance.segmentTextColor]
            tipControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        
        tipControl.selectedSegmentTintColor = Settings.sharedInstance.segmentColor
        
        
        
        
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.2, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        self.calculateTip(Any.self)
    }
    
    
}

    class Settings {
        static let sharedInstance = Settings()
        var backgroundColor = UIColor.white
        var boxColor = UIColor.white
        var textColor = UIColor.black
        var tint = UIColor.white
        var segmentColor = UIColor.white
        var segmentTextColor = UIColor.black
    }

