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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAnswer1Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 1
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer2Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer4Button(sender: AnyObject) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    func goNextQuestionWithAnimation() {
        //正解しているかどうか判定する
        if questionData.isCorrect() {
            //正解のアニメーションをしながら次の問題へ遷移する
            goNextQuestionWithCorrectAnimation()
        } else {
            //不正解のアニメーションをしながら次の問題へ遷移する
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    //次の問題に正解のアニメーション付きで遷移する
    func goNextQuestionWithCorrectAnimation() {
        //正解を伝える音を鳴らす
        AudioServicesPlayAlertSoundWithCompletion(1025, nil)
        
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            //アルファ値を1.0に変化させる(初期値はstoryboardで0.0に設定済み)
            self.correctImageview.alpha = 1.0
        }) { (Bool) -> Void in
            self.goNextQuestion()
        }
    }
    
    //次の問題へ遷移する
    func goNextQuestion() {
        //問題文がある場合は次の問題は遷移する
        if let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion(){
            //storyboardのIdentifierに設定した値(question)を指定して
            //ViewControllerを生成する
            if let nextQuestionViewController =
            storyboard?.instantiateViewControllerWithIdentifier("question")
                as? QuestionViewController {
                nextQuestionViewController.questionData = nextQuestion
                //storyboardのsegueを利用しない明示的な画面遷移処理
                self.presentViewController(nextQuestionViewController, animated: true, completion: nil)
            }
        } else {
            //問題文がなければ結果画面へ遷移する
            //storyboardのIdentifierに設定した(result)を指定して
            //ViewControllerを生成する
            if let resultViewController =
            storyboard?.instantiateViewControllerWithIdentifier("result")
                as? ResultViewController{
                //storyboardのsegueを利用しない明示的な画面遷移処理
                self.presentViewController(resultViewController, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
