//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Florentine, Robin on 3/13/17.
//  Copyright © 2017 Florentine, Robin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSetting: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard;
        defaultTipSetting.selectedSegmentIndex = defaults.integer(forKey:"defaultTipPercentage")
    }
    

    @IBAction func defaultTipChanged(_ sender: AnyObject) {
        let defaults = UserDefaults.standard;
        defaults.set(defaultTipSetting.selectedSegmentIndex, forKey: "defaultTipPercentage")
        print(defaultTipSetting.selectedSegmentIndex)
        defaults.synchronize()
    }
}
