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
    
    var exit = SKSpriteNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        
        
        
        
        playerOneScore = self.childNode(withName: "playerOneScore") as! SKLabelNode
        playerTwoScore = self.childNode(withName: "playerTwoScore") as! SKLabelNode

        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        exit = self.childNode(withName: "exit") as! SKSpriteNode
        exit.position.y = (self.frame.height/2)-60
        exit.position.x = (self.frame.width/2)-320
        
        
        playerone = self.childNode(withName: "playerone") as! SKSpriteNode
        playerone.position.y = (-self.frame.height/2)+100
        
        playertwo = self.childNode(withName: "playertwo") as! SKSpriteNode
        playertwo.position.y = (self.frame.height/2)-100
      
        
        
        
        
        
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        startGame()
    }
    
    func addScore(playerWhoWon : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == playerone{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        }
        else if playerWhoWon == playertwo {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
        }
        playerTwoScore.text = "\(score[1])"
        playerOneScore.text = "\(score[0])"
    }
    
    func startGame(){

        score = [0,0]
        
        playerTwoScore.text = "\(score[1])"
        playerOneScore.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
    }
    
    func pauseGame(){
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGameType == .playerTwo{
                if location.y > 0 {
                    playertwo.run(SKAction.moveTo(x: location.x , duration: 0.2))
                }
                if location.y < 0{
                    playerone.run(SKAction.moveTo(x: location.x , duration: 0.2))
                }
            } else {
            
            playerone.run(SKAction.moveTo(x: location.x , duration: 0.0))
            }
            
 
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGameType == .playerTwo{
                if location.y > 0 {
                    playertwo.run(SKAction.moveTo(x: location.x , duration: 0.2))
                }
                if location.y < 0{
                    playerone.run(SKAction.moveTo(x: location.x , duration: 0.2))
                }
            } else {
            
            playerone.run(SKAction.moveTo(x: location.x , duration: 0.0))
            }
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        switch currentGameType{
        case .easy:
            playertwo.run(SKAction.moveTo(x: ball.position.x , duration: 1.3))
            break
        case .medium:
            playertwo.run(SKAction.moveTo(x: ball.position.x , duration: 0.1))
            break
        case .hard:
            playertwo.run(SKAction.moveTo(x: ball.position.x , duration: 0.7))
            break
        case .playerTwo:
           
            break
        }
        
        
        
        if ball.position.y <= playerone.position.y + 10 {
            addScore(playerWhoWon: playertwo)
        }
        else if ball.position.y >= playertwo.position.y - 10{
            addScore(playerWhoWon: playerone)
        }
        
        
    }
}
