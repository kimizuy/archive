//
//  ResultViewController.swift
//  MyCalc
//
//  Created by Kimizu Yamasaki on 2016/03/18.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class ResultViewController: UITableViewController {
    
    var price: Int = 0
    
    var percent: Int = 0
    
    @IBOutlet weak var resultField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let percentValue = Float(percent) / 100
        
        let waribikiPrice = Float(price) * percentValue
        
        let percentOffPrice = price - Int(waribikiPrice)
        
        resultField.text = "\(percentOffPrice)"
    }

}
