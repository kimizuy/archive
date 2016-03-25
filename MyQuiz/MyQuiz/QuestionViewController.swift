//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by Kimizu Yamasaki on 2016/03/25.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {

    var questionData: QuestionData!
    
    @IBOutlet weak var questionNoLabel: UILabel!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageview: UIImageView!
    @IBOutlet weak var incorrectImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期データ設定処理。全画面で設定済みのquestionDataから値を取り出す
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, forState: UIControlState.Normal)
        answer2Button.setTitle(questionData.answer2, forState: UIControlState.Normal)
        answer3Button.setTitle(questionData.answer3, forState: UIControlState.Normal)
        answer4Button.setTitle(questionData.answer4, forState: UIControlState.Normal)
    }
    
    
    
    
    
    
    
    
    
}
