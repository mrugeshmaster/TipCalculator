//
//  ViewController.swift
//  tipper
//
//  Created by admin on 7/26/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        // Get the Bill Amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate tip and total
        let tipPercentages = [0.15,0.18,0.2]
        
        // Tip Index
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip and labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
}

