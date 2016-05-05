//
//  GameScene.swift
//  SaveNagoyaSpeciality
//
//  Created by Kimizu Yamasaki on 2016/05/01.
//  Copyright © 2016年 Kimizu Yamasaki. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //どんぶり
    var bowl: SKSpriteNode?
    //タイマー
    var timer: NSTimer?
    // 落下判定用シェイプ
    var lowestShape: SKShapeNode?
    //スコア用プロパティ
    var score = 0
    var scoreLabel: SKLabelNode?
    var scoreList = [100, 200, 300, 500, 800, 1000, 1500]
    
    override func didMoveToView(view: SKView) {
        //下方向に重力を追加
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
        //背景スプライトの追加
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        background.size = self.size
        self.addChild(background)
        //落下検知用シェイプノードを追加
        let lowestShape = SKShapeNode(rectOfSize: CGSize(width: self.size.width*3, height: 10))
        lowestShape.position = CGPoint(x: self.size.width*0.5, y: -10)
        //シェイプに合わせてPhysicsBodyを生成
        let physicsBody = SKPhysicsBody(rectangleOfSize: lowestShape.frame.size)
        physicsBody.dynamic = false
        physicsBody.contactTestBitMask = 0x1 << 1   //衝突を検知する対象のビットマスクを指定
        lowestShape.physicsBody = physicsBody
        
        self.addChild(lowestShape)
        self.lowestShape = lowestShape
        //どんぶりを追加
        let bowlTexture = SKTexture(imageNamed: "bowl")
        let bowl = SKSpriteNode(texture: bowlTexture)
        bowl.position = CGPoint(x: self.size.width * 0.5, y: 100)
        bowl.size = CGSize(width: bowlTexture.size().width*0.5, height: bowlTexture.size().height*0.5)
        bowl.physicsBody = SKPhysicsBody(texture: bowlTexture, size: bowl.size)
        bowl.physicsBody?.dynamic = false
        self.bowl = bowl
        self.addChild(bowl)
        //スコア用ラベル
        let scoreLabel = SKLabelNode(fontNamed: "Helvetica")
        scoreLabel.position = CGPoint(x: self.size.width * 0.92, y: self.size.height * 0.78)
        scoreLabel.text = "¥0"
        scoreLabel.fontSize = 32
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Right   //右寄せ
        scoreLabel.fontColor = UIColor.greenColor()
        self.addChild(scoreLabel)
        self.scoreLabel = scoreLabel

        self.fallNagoyaSpecialty()
        //タイマーを作成
        self.timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(GameScene.fallNagoyaSpecialty), userInfo: nil, repeats: true)
    }
    
    //名古屋名物を落下させる
    func fallNagoyaSpecialty() {
        let index = Int(arc4random_uniform(7))  //0~6の乱数を生成
        let texture = SKTexture(imageNamed: "\(index)")
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPointMake(self.size.width*0.5, self.size.height)
        sprite.size = CGSize(width: texture.size().width*0.5, height: texture.size().height*0.5)
        //テクスチャからPhysicsBodyを追加
        sprite.physicsBody = SKPhysicsBody(texture: texture, size: sprite.size)
        sprite.physicsBody?.contactTestBitMask = 0x1 << 1   //衝突を検知する対象のビットマスクを指定
        
        self.addChild(sprite)
        
        self.score += self.scoreList[index]
        self.scoreLabel?.text = "¥\(self.score)"
    }
    
    //タッチ開始時
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            //selfは今いるクラスのインスタンス
            let location = touch.locationInNode(self)
            let action = SKAction.moveTo(CGPoint(x: location.x, y: 100), duration: 0.2)
            self.bowl?.runAction(action)
        }
    }
    
    //ドラッグ時
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.locationInNode(self)
            let action = SKAction.moveTo(CGPoint(x: location.x, y: 100), duration: 0.2)
            self.bowl?.runAction(action)
        }
    }
    
    //ゲームオーバー処理
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.node == self.lowestShape || contact.bodyB.node == self.lowestShape {
            let sprite = SKSpriteNode(imageNamed: "gameover")
            sprite.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
            self.addChild(sprite)
            self.paused = true
            self.timer?.invalidate()
        }
    }
}