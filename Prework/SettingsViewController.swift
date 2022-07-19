//
//  SettingsViewController.swift
//  Prework
//
//  Created by Hoa Doan on 7/17/22.
//

import UIKit

class SettingsViewController: UIViewController {
    var delegate: UpdateVC1?

    @IBOutlet weak var setDefaultTipButton: UIButton!
    @IBOutlet weak var tip3TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip1TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        let tip1Value = defaults.string(forKey: "defaultTip1") ?? "15"
//        tipLabelTest.text = tip1Value
        
    }
//    @IBAction func setDefaultTip1(_ sender: Any) {
//        print("Hello")
//
//        tipLabelTest.text = "null"
//    }
    @IBAction func setDefaultTips(_ sender: Any) {
        // saving the data
        let defaults = UserDefaults.standard
        defaults.set(tip1TextField.text, forKey: "defaultTip1")
        defaults.set(tip2TextField.text, forKey: "defaultTip2")
        defaults.set(tip3TextField.text, forKey: "defaultTip3")
        defaults.synchronize()
        delegate?.updateDefaultTip()
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
