//
//  ViewController.swift
//  SaveNagoyaSpeciality
//
//  Created by Kimizu Yamasaki on 2016/05/01.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //シーンの作成
        let scene = GameScene()
        // View Controller の View を SKView 型として取り出す 
        let view = self.view as! SKView
        //FPSの表示
        view.showsFPS = true
        //ノード数の表示
        view.showsNodeCount = true
        //シーンのサイズをビューに合わせる
        scene.size = view.frame.size
        //ビュー上にシーンを表示
        view.presentScene(scene)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

