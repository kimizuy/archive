//
//  ViewController.swift
//  MyTodoList
//
//  Created by Developer on 2016/03/22.
//  Copyright © 2016年 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //TODOを格納した配列
    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //+ボタンをタップした際に呼ばれる処理
    @IBAction func tapAddButton(sender: AnyObject){
        //アラートダイアログ作成
        let alertController = UIAlertController(title: "TODO追加",
                                                message: "TODOを入力してください",
                                                preferredStyle: UIAlertControllerStyle.Alert)
        //テキストエリアを追加
        alertController.addTextFieldWithConfigurationHandler(nil)
        //OKボタンを追加
        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertActionStyle.Default){
                                        (action:UIAlertAction) -> void in
        //OKボタンが押されたときの処理
                                        if let textField = alertController.textFields?.first{
                                            //TODOの配列に入力した値を挿入。先頭に挿入する
                                            self.todoList.insert(textField.text!, atIndex: 0)
                                            
                                            //テーブルに行が追加されたことをテーブルに通知
                                            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Right)
                                        }
        }
        //OKボタンを追加
        alertController.addAction(okAction)
        
        //Canselボタンがタップされたときの処理
        let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle, handler: nil)
        //CANCELボタンを追加
        alertController.addAction(cancelAction)
        
        //アラートダイアログを表示
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}

