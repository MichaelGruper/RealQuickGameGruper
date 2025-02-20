//
//  GameScene.swift
//  RealQuickGameGruper
//
//  Created by MICHAEL GRUPER on 2/19/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball : SKSpriteNode!
    let cam = SKCameraNode()
    var points = 0
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
        physicsWorld.contactDelegate = self
        }
   
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "ball" || contact.bodyB.node?.name == "ball"{
            if contact.bodyB.node?.name == "coin"{
                points += 1
                print(points)
            }
            else{
                ball.physicsBody?.velocity.dx = -10000
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        cam.position = ball.position
    }
    
    func reset(){
        ball.position = CGPoint(x: Int.random(in: -320...320), y: 600)
    }
    func jump(){
        ball.physicsBody?.velocity = CGVector(dx: CGFloat.random(in: -100...100), dy: 500)
    }
}
