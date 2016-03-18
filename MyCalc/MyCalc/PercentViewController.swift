//
//  PercentViewController.swift
//  MyCalc
//
//  Created by Kimizu Yamasaki on 2016/03/18.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class PercentViewController: UIViewController {
    
    var price: Int = 0
    
    @IBOutlet weak var percentField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController = segue.destinationViewController as! ResultViewController
        
        viewController.price = price
        if let percent = Int(percentField.text!){
            viewController.percent = percent
        }
    }
    
    @IBAction func tap1Button(sender: AnyObject) {
        let value = percentField.text! + "1"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap2Button(sender: AnyObject) {
        let value = percentField.text! + "2"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }

    @IBAction func tap3Button(sender: AnyObject) {
        let value = percentField.text! + "3"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap4Button(sender: AnyObject) {
        let value = percentField.text! + "4"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap5Button(sender: AnyObject) {
        let value = percentField.text! + "5"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap6Button(sender: AnyObject) {
        let value = percentField.text! + "6"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap7Button(sender: AnyObject) {
        let value = percentField.text! + "7"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap8Button(sender: AnyObject) {
        let value = percentField.text! + "8"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }

    @IBAction func tap9Button(sender: AnyObject) {
        let value = percentField.text! + "9"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tap0Button(sender: AnyObject) {
        let value = percentField.text! + "0"
        if let percent = Int(value){
            percentField.text = "\(percent)"
        }
    }
    
    @IBAction func tapClearButton(sender: AnyObject) {
        percentField.text = "0"
    }

}
