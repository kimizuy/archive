//
//  GameScene.swift
//  ShrimpSwim
//
//  Created by Kimizu Yamasaki on 2016/05/05.
//  Copyright (c) 2016年 Kimizu Yamasaki. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var scoreLabelNode: SKLabelNode!
    var score: UInt32!
    
    var player: SKSpriteNode!
    
    struct Constants {
        //Player画像
        static let playerImages = ["shrimp01", "shrimp02", "shrimp03", "shrimp04"]
    }
    
    struct ColliderType {
        //staticは静的を意味し、そのクラス(または構造体)のインスタンスを作成しなくてもアクセスできるもの
        static let Player: UInt32 = (1 << 0)
        static let World: UInt32 = (1 << 1)
        static let Colal: UInt32 = (1 << 2)
        static let Score: UInt32 = (1 << 3)
        static let None: UInt32 = (1 << 4)
    }
    
    var baseNode: SKNode!
    var coralNode: SKNode!
    
    override func didMoveToView(view: SKView) {
        //スコアラベルの変数の初期化
        score = 0
        //物理シミュレーションを設定
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -2.0)
        self.physicsWorld.contactDelegate = self
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
        //天井と地面を構築
        self.setupCeilingAndLand()
        //プレイキャラを構築
        self.setupPlayer()
        //障害物のサンゴを構築
        self.setupCoral()
        //スコアラベルを構築
        self.setupScoreLabel()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("当たった")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let locaton = touch.locationInNode(self)
            //プレイヤーに加えられている力をゼロにする
            player.physicsBody?.velocity = CGVector.zero    //CGVector(dx:0.0,dy:0.0)
            //プレイヤーにY軸方向へ力を加える
            player.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 23.0))
        }
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
        for var i: CGFloat = 0.0; i < needNumber; i++ {
            let sprite = SKSpriteNode(texture: texture)
            sprite.zPosition = -100.0
            sprite.position = CGPoint(x: i * sprite.size.width, y: self.frame.size.height / 2.0)
            sprite.runAction(repeatForeverAnim)
            baseNode.addChild(sprite)
        }
    }
    func setupCeilingAndLand() {
        //地面画像を読み込み
        let land = SKTexture(imageNamed: "land")
        land.filteringMode = .Nearest
        //必要な画像枚数を算出
        let landNeedNumber = 2.0 + (self.frame.size.width / land.size().width)
        //アニメーションを作成
        let moveLandAnim = SKAction.moveByX(-land.size().width, y: 0.0, duration: NSTimeInterval(land.size().width / 100.0))
        let resetLandAnim = SKAction.moveByX(land.size().width, y: 0.0, duration: 0.0)
        let repeatForeverLandAnim = SKAction.repeatActionForever(SKAction.sequence([moveLandAnim, resetLandAnim]))
        //画像の配置とアニメーションを設定
        for var i: CGFloat = 0.0; i < landNeedNumber; i++ {
            let sprite = SKSpriteNode(texture: land)
            sprite.position = CGPoint(x: i * sprite.size.width, y: sprite.size.height / 2.0)
            //画像に物理シミュレーションを設定
            sprite.physicsBody = SKPhysicsBody(texture: land, size: land.size())
            sprite.physicsBody?.dynamic = false
            sprite.physicsBody?.categoryBitMask = ColliderType.World
            sprite.runAction(repeatForeverLandAnim)
            baseNode.addChild(sprite)
        }
        //天井画像を読み込み
        let ceiling = SKTexture(imageNamed: "ceiling")
        ceiling.filteringMode = .Nearest
        //必要な画像枚数を算出
        let ceilingNeedNumber = 2.0 + (self.frame.size.width / land.size().width)
        //画像の配置とアニメーションを設定
        for var i: CGFloat = 0.0; i < ceilingNeedNumber; i++ {
            let sprite = SKSpriteNode(texture: ceiling)
            sprite.position = CGPoint(x: i * sprite.size.width, y: self.frame.size.height - sprite.size.height / 2.0)
            //画像に物理シミュレーションを設定
            sprite.physicsBody = SKPhysicsBody(texture: ceiling, size: land.size())
            sprite.physicsBody?.dynamic = false
            sprite.physicsBody?.categoryBitMask = ColliderType.World
            sprite.runAction(repeatForeverLandAnim)
            baseNode.addChild(sprite)
        }
    }
    
    func setupPlayer() {
        //Playerのパラパラアニメーション作成に必要なSKTextureクラスの配列を定義
        var playerTexture = [SKTexture]()
        //パラパラアニメーションに必要な画像を読み込む
        for imageName in Constants.playerImages {
            let texture = SKTexture(imageNamed: imageName)
            texture.filteringMode = .Linear
            playerTexture.append(texture)
        }
        //パラパラ漫画のアニメーションを作成
        let playerAnimation = SKAction.animateWithTextures(playerTexture, timePerFrame: 0.2)
        let loopAnimation = SKAction.repeatActionForever(playerAnimation)
        //キャラクターを生成し、アニメーションを設定
        player = SKSpriteNode(texture: playerTexture[0])
        player.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)
        player.runAction(loopAnimation)
        
        //物理シミュレーションを設定
        player.physicsBody = SKPhysicsBody(texture: playerTexture[0], size: playerTexture[0].size())
        player.physicsBody?.dynamic = true
        player.physicsBody?.allowsRotation = false
        //自分自身にplayerカテゴリを設定
        player.physicsBody?.categoryBitMask = ColliderType.Player
        //衝突判定相手にWorldとCoralを設定
        //「 | 」は論理和
        player.physicsBody?.collisionBitMask = ColliderType.World | ColliderType.Colal
        player.physicsBody?.contactTestBitMask = ColliderType.World | ColliderType.Colal
        
        self.addChild(player)
    }
    
    func setupCoral() {
        //サンゴ画像を読み込み
        let coralUnder = SKTexture(imageNamed: "coral_under")
        coralUnder.filteringMode = .Linear
        let coralAbove = SKTexture(imageNamed: "coral_above")
        coralAbove.filteringMode = .Linear
        //移動する距離を算出
        let distanceToMove = CGFloat(self.frame.size.width + 2.0 * coralUnder.size().width)
        //アニメーションを作成
        let moveAnim = SKAction.moveByX(-distanceToMove, y: 0.0, duration: NSTimeInterval(distanceToMove / 100.0))
        let removeAnim = SKAction.removeFromParent()
        let coralAnim = SKAction.sequence([moveAnim, removeAnim])
        //サンゴを生成するメソッドを呼び出すアニメーションを作成
        let newCoralAnim = SKAction.runBlock({
            //サンゴに関するノードを乗せるノードを作成
            let coral = SKNode()
            coral.position = CGPoint(x: self.frame.width + coralUnder.size().width * 2, y: 0.0)
            coral.zPosition = -40.0
            
            //地面から伸びるサンゴのy座標を算出
            let height = UInt32(self.frame.size.height / 12)
            let y = CGFloat(arc4random_uniform(height * 2) + height)
            //地面から伸びるサンゴを生成
            let under = SKSpriteNode(texture: coralUnder)
            under.position = CGPoint(x: 0.0, y: y)
            //サンゴに物理シミュレーションを設定
            under.physicsBody = SKPhysicsBody(texture: coralUnder, size: under.size)
            under.physicsBody?.dynamic = false
            under.physicsBody?.categoryBitMask = ColliderType.Colal
            under.physicsBody?.contactTestBitMask = ColliderType.Player
            coral.addChild(under)
            
            //天井から伸びるサンゴを作成
            let above = SKSpriteNode(texture: coralAbove)
            above.position = CGPoint(x: 0.0, y: y + (under.size.height / 2.0) + 160.0 + (above.size.height / 2.0))
            //サンゴに物理シミュレーションを設定
            above.physicsBody = SKPhysicsBody(texture: coralAbove, size: above.size)
            above.physicsBody?.dynamic = false
            above.physicsBody?.categoryBitMask = ColliderType.Colal
            above.physicsBody?.contactTestBitMask = ColliderType.Player
            coral.addChild(above)
            //スコアをカウントアップするノードを作成
            let scoreNode = SKNode()
            scoreNode.position = CGPoint(x: (above.size.width / 2.0) + 5.0, y: self.frame.height / 2.0)
            //スコアノードに物理シミュレーションを設定
            scoreNode.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 10.0, height: self.frame.size.height))
            scoreNode.physicsBody?.dynamic = false
            scoreNode.physicsBody?.categoryBitMask = ColliderType.Score
            scoreNode.physicsBody?.contactTestBitMask = ColliderType.Player
            coral.addChild(scoreNode)
            
            coral.runAction(coralAnim)
            self.coralNode.addChild(coral)
        })
        let delayAnim = SKAction.waitForDuration(2.5)
        let repeatForeverAnim = SKAction.repeatActionForever(SKAction.sequence([newCoralAnim, delayAnim]))
        self.runAction(repeatForeverAnim)
    }
    
    func setupScoreLabel() {
        //フォント名"Arial Bold"でラベルを作成
        scoreLabelNode = SKLabelNode(fontNamed: "Arial Bold")
        scoreLabelNode.fontColor = UIColor.blackColor()
        scoreLabelNode.position = CGPoint(x: self.frame.width / 2.0, y: self.frame.size.height * 0.9)
        scoreLabelNode.zPosition = 100.0
        scoreLabelNode.text = String(score)
        self.addChild(scoreLabelNode)
    }
}
