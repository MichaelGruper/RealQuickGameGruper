//
//  GameViewController.swift
//  RealQuickGameGruper
//
//  Created by MICHAEL GRUPER on 2/19/25.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var play : GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                play = scene as? GameScene
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func resetButtonAction(_ sender: UIButton) {
        play.reset()
    }
    @IBAction func jumpButtonAction(_ sender: UIButton) {
        play.ball.physicsBody?.velocity.dy = 500
        play.ball.physicsBody?.velocity.dx = 50
    }
}
