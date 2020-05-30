//
//  StartViewController.swift
//  MyQuiz
//
//  Created by Kimizu Yamasaki on 2016/03/25.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移先画面の取り出し
        if let nextViewController = segue.destinationViewController as? QuestionViewController {
            //問題文の取り出し
            if let questionData = QuestionDataManager.sharedInstance.nextQuestion() {
                //問題文のセット
                nextViewController.questionData = questionData
            }
        }
    }
    
    //タイトルに戻ってくるときに呼び出される処理
    @IBAction func goToTitle(sender :UIStoryboardSegue){
        
    }

}
