//
//  GameScene.swift
//  iPong
//
//  Created by Kyle Feller on 1/24/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var playerone = SKSpriteNode()
    var playertwo = SKSpriteNode()
    
    var playerOneScore = SKLabelNode()
    var playerTwoScore = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        startGame()
        
        playerOneScore = self.childNode(withName: "playerOneScore") as! SKLabelNode
        playerTwoScore = self.childNode(withName: "playerTwoScore") as! SKLabelNode

        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        playerone = self.childNode(withName: "playerone") as! SKSpriteNode
        playertwo = self.childNode(withName: "playertwo") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == playerone{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        }
        else if playerWhoWon == playertwo {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        playerTwoScore.text = "\(score[1])"
        playerOneScore.text = "\(score[0])"
    }
    
    func startGame(){
        score = [0,0]
        
        playerTwoScore.text = "\(score[1])"
        playerOneScore.text = "\(score[0])"

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            playerone.run(SKAction.moveTo(x: location.x , duration: 0.2))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            playerone.run(SKAction.moveTo(x: location.x , duration: 0.0))
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        playertwo.run(SKAction.moveTo(x: ball.position.x , duration: 0.5))
        
        if ball.position.y <= playerone.position.y + 40 {
            addScore(playerWhoWon: playertwo)
        }
        else if ball.position.y >= playertwo.position.y - 40{
            addScore(playerWhoWon: playerone)
        }
        
        
    }
}
