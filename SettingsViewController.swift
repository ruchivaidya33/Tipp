//
//  SettingsViewController.swift
//  Tipp
//
//  Created by Honors on 12/17/18.
//  Copyright © 2018 Ruchi Vaidya. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        let first = defaults.double(forKey: "Per1")
        firstField.text = String(first)
        let second = defaults.double(forKey: "Per2")
        secondField.text = String(second)
        let third = defaults.double(forKey: "Per3")
        thirdField.text = String(third)
    }
    
    @IBAction func newFirst(_ sender: Any) {
        let newFirst = Double(firstField.text!) ?? 18
        defaults.set(newFirst, forKey: "Per1")
        defaults.synchronize()
    }
    
    @IBAction func newSecond(_ sender: Any) {
        let newSecond = Double(secondField.text!) ?? 20
        defaults.set(newSecond, forKey: "Per2")
        defaults.synchronize()
    }
    
    @IBAction func newThird(_ sender: Any) {
        let newThird = Double(thirdField.text!) ?? 25
        defaults.set(newThird, forKey: "Per3")
        defaults.synchronize()
    }
    
    @IBAction func resetPercentages(_ sender: Any) {
        firstField.text = String(18)
        secondField.text = String(20)
        thirdField.text = String(25)
        
        let default1 = Double(firstField.text!) ?? 18
        let default2 = Double(secondField.text!) ?? 20
        let default3 = Double(thirdField.text!) ?? 25
        
        defaults.set(default1, forKey: "Per1")
        defaults.set(default2, forKey: "Per2")
        defaults.set(default3, forKey: "Per3")
        defaults.synchronize()
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
