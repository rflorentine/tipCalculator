//
//  ViewController.swift
//  Tippy
//
//  Created by Florentine, Robin on 3/12/17.
//  Copyright © 2017 Florentine, Robin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnTap(_ sender: AnyObject) {
        view.endEditing(true);
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        self.manageTip()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
        let defaults = UserDefaults.standard;
        let defaultTip = defaults.integer(forKey: "defaultTipPercentage")
        tipPercentControl.selectedSegmentIndex = defaultTip;
        self.manageTip()
    }
    
    
    func manageTip() {
        let tipPercentages = [ 0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipPercentControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format:"$%.2f", tip)
        totalAmountLabel.text = String(format:"$%.2f", total)
    }
    
}

