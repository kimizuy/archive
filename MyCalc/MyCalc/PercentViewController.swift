//
//  PercentViewController.swift
//  MyCalc
//
//  Created by Kimizu Yamasaki on 2016/03/18.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class PercentViewController: UITableViewController {
    
    var price: Int = 0
    
    @IBOutlet weak var percentField: UITextField!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
