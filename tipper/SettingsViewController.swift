//
//  SettingsViewController.swift
//  tippy
//
//  Created by admin on 7/27/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func defaultTipChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "setDefaultTipIndex")
        
        defaults.synchronize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        defaultTipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "setDefaultTipIndex")
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
