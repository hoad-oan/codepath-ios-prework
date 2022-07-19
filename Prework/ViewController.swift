//
//  ViewController.swift
//  Prework
//
//  Created by Hoa Doan on 7/15/22.
//

import UIKit

class ViewController: UIViewController, UpdateVC1 {

//    @IBOutlet weak var tipLabelTest: UILabel!
    @IBOutlet weak var sliderLabelValue: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var splitAmountTextField: UITextField!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    // tip value from text field
    var tip1Text: String?
    var tip2Text: String?
    var tip3Text: String?
    
//    func reloadTipDefaultValue() {
//        let defaults = UserDefaults.standard
//        // update tip value from text field
//        let tip1Text = defaults.string(forKey: "defaultTip1") ?? "15" + "%"
//        let tip2Text = defaults.string(forKey: "defaultTip2") ?? "18" + "%"
//        let tip3Text = defaults.string(forKey: "defaultTip3") ?? "20" + "%"
//
//        tipControl?.setTitle(tip1Text, forSegmentAt: 0)
//        tipControl?.setTitle(tip2Text, forSegmentAt: 1)
//        tipControl?.setTitle(tip3Text, forSegmentAt: 2)
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        func loadData() {
//            // code to load data from network, and refresh the interface
//            self.view.layoutIfNeeded()
//        }
//        reloadTipDefaultValue()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from input field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // calculate tip based on chosen percentage
        
        let defaults = UserDefaults.standard
        // update tip value from text field
        let tip1Double = defaults.double(forKey: "defaultTip1") / 100.00
        let tip2Double = defaults.double(forKey: "defaultTip2") / 100.00
        let tip3Double = defaults.double(forKey: "defaultTip3") / 100.00
        
        let tipPercentage = [tip1Double, tip2Double, tip3Double]
        let tipAmount = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let totalAmount = bill + tipAmount
        // calculate split amount
        let splitNumber = Double(splitAmountTextField.text!) ?? 1
        let splitAmount = totalAmount / splitNumber
        
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        // update total amount
        totalLabel.text = String(format: "$%.2f", totalAmount)
        // update split amount
        splitAmountLabel.text = String(format: "$%.2f", splitAmount)
    }
    @IBAction func sliderShowValue(_ sender: UISlider) {
        let bill = Double(billAmountTextField.text!) ?? 0
        // update slider label for tip percentage
        let sliderValue = Double(sender.value)
        sliderLabelValue.text = String(format: "%-.2f", sliderValue) + "%"
        let tipAmount = bill * sliderValue / 100
        let totalAmount = bill + tipAmount
        // calculate split amount
        let splitNumber = (Double(splitAmountTextField.text!) ?? 1)
        let splitAmount = totalAmount / splitNumber
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%-.2f", tipAmount)
        // update total amount
        totalLabel.text = String(format: "$%-.2f", totalAmount)
        // update split amount
        splitAmountLabel.text = String(format: "$%.2f", splitAmount)
    }
    func updateDefaultTip() {
        let defaults = UserDefaults.standard
        // update tip value from text field
        let tip1Text = "\(defaults.string(forKey: "defaultTip1") ?? "15")%"
        let tip2Text = "\(defaults.string(forKey: "defaultTip2") ?? "18")%"
        let tip3Text = "\(defaults.string(forKey: "defaultTip3") ?? "20")%"

        tipControl?.setTitle(tip1Text, forSegmentAt: 0)
        tipControl?.setTitle(tip2Text, forSegmentAt: 1)
        tipControl?.setTitle(tip3Text, forSegmentAt: 2)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? SettingsViewController {
                destination.delegate = self
            }
    }
}
protocol UpdateVC1 {
    func updateDefaultTip()
}

