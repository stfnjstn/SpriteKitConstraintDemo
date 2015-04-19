//
//  GameScene.swift
//  SpriteKitConstraintDemo
//
//  Created by STEFAN JOSTEN on 19/04/15.
//  Copyright (c) 2015 Stefan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var sprite = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.backgroundColor = UIColor.blackColor()
        
        // Create the followed sprite
        sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.xScale = 0.15
        sprite.yScale = 0.15
        sprite.position = CGPointMake(100, 100)
        self.addChild(sprite)
        
        // Create the follower sprite
        let followerSprite = SKSpriteNode(imageNamed:"Spaceship")
        followerSprite.xScale = 0.15
        followerSprite.yScale = 0.15
        followerSprite.position = CGPointMake(150, 150)
        followerSprite.color = UIColor.redColor()
        followerSprite.colorBlendFactor=0.8
        self.addChild(followerSprite)
        
        // Define Constraints for following behavior
        let rangeToSprite = SKRange(lowerLimit: 100.0, upperLimit: 150.0)
        let distanceConstraint = SKConstraint.distance(rangeToSprite, toNode: sprite)
        
        // Define Constraints for orientation/targeting behavior
        let rangeForOrientation = SKRange(lowerLimit: CGFloat(M_2_PI*7), upperLimit: CGFloat(M_2_PI*7))
        let orientConstraint = SKConstraint.orientToNode(sprite, offset: rangeForOrientation)
        
        // Add constraints
        followerSprite.constraints = [orientConstraint, distanceConstraint]
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let action = SKAction.moveTo(location, duration: 1)
            sprite.runAction(action)
        }
 
    }
    
 
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
