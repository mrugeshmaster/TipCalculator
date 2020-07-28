//
//  ViewController.swift
//  tippy
//
//  Created by admin on 7/27/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    @IBOutlet weak var equalsLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        
        let getDefaultTipIndex = defaults.integer(forKey: "setDefaultTipIndex")
        defaults.synchronize()
        
        tipControl.selectedSegmentIndex = getDefaultTipIndex
        calculateTip(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayTipControl(_ sender: Any) {
        
        // Unhide Labels and Segment Control
        tipControl.isHidden = false
        plusLabel.isHidden = false
        equalsLabel.isHidden = false
        tipLabel.isHidden = false
        totalLabel.isHidden = false
    }
    
    @IBAction func calculateTip(_ sender:Any) {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15,0.18,0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = tip + bill
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
}

