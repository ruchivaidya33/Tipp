//
//  ViewController.swift
//  Tipp
//
//  Created by Honors on 12/17/18.
//  Copyright © 2018 Ruchi Vaidya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var yourPartLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var SettingsButton: UIBarButtonItem!
    var tipPercentages = [0.18, 0.2, 0.25]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let p1 = defaults.double(forKey:"Per1")
        tipPercentages[0] = p1/100
        tipControl.setTitle(String(p1) + "%", forSegmentAt:0)
        let p2 = defaults.double(forKey:"Per2")
        tipPercentages[1] = p2/100
        tipControl.setTitle(String(p2) + "%", forSegmentAt:1)
        let p3 = defaults.double(forKey:"Per3")
        tipPercentages[2] = p3/100
        tipControl.setTitle(String(p3) + "%", forSegmentAt:2)
        calculateTip(tipControl)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func splitBill(_ sender: UISlider) {
        splitLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let split = Double(splitLabel.text!) ?? 1.0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let yourpart = total/split
        splitLabel.text = String(Int(split))
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text =  String(format: "$%.2f", total)
        yourPartLabel.text = String(format: "$%.2f", yourpart)
    }
    
}

