//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Kimizu Yamasaki on 2016/03/25.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var correctPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionCount = QuestionDataManager.sharedInstance.questionDataArray.count
        //問題数を取得
        var correctCount :Int = 0   //正解数を取得
        for questionData in QuestionDataManager.sharedInstance.questionDataArray {
            //正解数を計算する
            if questionData.isCorrect() {
                correctCount += 1
            }
        }
        let correctPercent :Float =
        (Float(correctCount) / Float(questionCount)) * 100  //正解率の計算
        //正解率を小数点第一まで設定する
        correctPercentLabel.text = String(format: "%.01f", correctPercent) + "%"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
