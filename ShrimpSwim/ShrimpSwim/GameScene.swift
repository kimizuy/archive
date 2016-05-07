//
//  GameScene.swift
//  ShrimpSwim
//
//  Created by Kimizu Yamasaki on 2016/05/05.
//  Copyright (c) 2016年 Kimizu Yamasaki. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var baseNode: SKNode!
    var coralNode: SKNode!
    
    override func didMoveToView(view: SKView) {
        //全ノードの親となるノードを生成
        baseNode = SKNode()
        baseNode.speed = 1.0
        self.addChild(baseNode)
        //障害物を追加するノードを生成
        coralNode = SKNode()
        baseNode.addChild(coralNode)
        //背景画像を構築
        self.setupBackgroundSea()
        //背景の岩山画像を構築
        self.setupBackgroundRock()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func setupBackgroundRock() {
        //岩山画像(下)を読み込む
        let under = SKTexture(imageNamed: "rock_under")
        under.filteringMode = .Nearest
        //必要な画像枚数を算出
        let underNeedNumber: CGFloat = 2.0 + (self.frame.size.width / under.size().width)
        //アニメーションを作成
        let moveUnderAnim = SKAction.moveByX(-under.size().width, y: 0.0, duration: NSTimeInterval(under.size().width / 20.0))
        let resetUnderAnim = SKAction.moveByX(under.size().width, y: 0.0, duration: 0.0)
        let repeatForeverUnderAnim = SKAction.repeatActionForever(SKAction.sequence([moveUnderAnim, resetUnderAnim]))
        for var i: CGFloat = 0; i < underNeedNumber; i++ {
            let sprite = SKSpriteNode(texture: under)
            sprite.zPosition = -50.0
            sprite.position = CGPoint(x: i * sprite.size.width, y: sprite.size.height / 2.0)
            sprite.runAction(repeatForeverUnderAnim)
            baseNode.addChild(sprite)
        }
        //岩山画像(上)を読み込む
        let above = SKTexture(imageNamed: "rock_above")
        above.filteringMode = .Nearest
        //必要な画像枚数を算出
        let aboveNeedNumber: CGFloat = 2.0 + (self.frame.size.width / under.size().width)
        //アニメーションを作成
        let moveAboveAnim = SKAction.moveByX(-above.size().width, y: 0.0, duration: NSTimeInterval(above.size().width / 20.0))
        let resetAboveAnim = SKAction.moveByX(above.size().width, y: 0.0, duration: 0.0)
        let repeatForeverAboveAnim = SKAction.repeatActionForever(SKAction.sequence([moveAboveAnim, resetAboveAnim]))
        for var i: CGFloat = 0; i < aboveNeedNumber; i++ {
            let sprite = SKSpriteNode(texture: above)
            sprite.zPosition = -50.0
            //画面の上部に配置するのでY座標に注意
            sprite.position = CGPoint(x: i * sprite.size.width, y: self.frame.size.height - (sprite.size.height / 2.0))
            sprite.runAction(repeatForeverAboveAnim)
            baseNode.addChild(sprite)
        }
    }
    
    func setupBackgroundSea() {
        //背景画像を読み込む
        let texture = SKTexture(imageNamed: "background")
        texture.filteringMode = .Nearest
        //必要な画像枚数を算出
        let needNumber: CGFloat = 2.0 + (self.frame.size.width / texture.size().width)
        //アニメーションを作成
        let moveAnim = SKAction.moveByX(-texture.size().width, y: 0.0, duration: NSTimeInterval(texture.size().width / 10.0))
        let resetAnim = SKAction.moveByX(texture.size().width, y: 0.0, duration: 0.0)
        let repeatForeverAnim = SKAction.repeatActionForever(SKAction.sequence([moveAnim, resetAnim]))
        //画像の配置とアニメーションを設定
        for var i: CGFloat = 0; i < needNumber; i++ {
            let sprite = SKSpriteNode(texture: texture)
            sprite.zPosition = -100.0
            sprite.position = CGPoint(x: i * sprite.size.width, y: self.frame.size.height / 2.0)
            sprite.runAction(repeatForeverAnim)
            baseNode.addChild(sprite)
        }
    }
}
