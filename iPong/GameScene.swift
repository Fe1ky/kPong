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
    
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        playerone = self.childNode(withName: "playerone") as! SKSpriteNode
        playertwo = self.childNode(withName: "playertwo") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
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
            
            playerone.run(SKAction.moveTo(x: location.x , duration: 0.2))
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        playertwo.run(SKAction.moveTo(x: ball.position.x , duration: 1.0))
    }
}
