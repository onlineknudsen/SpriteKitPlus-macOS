//
//  GameScene.swift
//  SpriteKitPlus
//
//  Created by Lin Knudsen on 11/3/18.
//  Copyright © 2018 Lin Knudsen. All rights reserved.
//

import SpriteKit

open class GameScene: SKScene {
    
    public let inputManager: InputManager = InputManager()
    
    public var deltaTime: TimeInterval = 0.0
    private var lastTime: TimeInterval = 0.0
    
    open override func didMove(to view: SKView) {
        setupTrackingArea()
        addChild(inputManager)
    }
    
    //MARK: - Update
    open override func update(_ currentTime: TimeInterval) {
        deltaTime = currentTime - lastTime
        lastTime = currentTime
        
        children.forEach { ($0 as? Updatable)?.update(deltaTime: deltaTime) }
    }
    
    open override func didFinishUpdate() {
        children.forEach { ($0 as? LateUpdatable)?.lateUpdate() }
    }
    
    open override func willMove(from view: SKView) {
        view.trackingAreas.forEach { view.removeTrackingArea($0)}
    }
    
    private func setupTrackingArea() {
        guard let view = view else { return }
        
        let options = [NSTrackingArea.Options.mouseMoved, .activeInKeyWindow] as NSTrackingArea.Options
        let trackingArea = NSTrackingArea(rect: view.frame, options: options, owner: self, userInfo: nil)
        
        view.addTrackingArea(trackingArea)
    }

}
//MARK: - Input
extension GameScene {
    open override func keyDown(with event: NSEvent) {
        inputManager.setKeyDown(keyCode: event.keyCode)
    }
    
    open override func keyUp(with event: NSEvent) {
        inputManager.setKeyUp(keyCode: event.keyCode)
    }
    
    open override func mouseDown(with event: NSEvent) {
        inputManager.setMouseDown(mouseButton: Mouse.leftButton)
    }
    
    open override func mouseUp(with event: NSEvent) {
        inputManager.setMouseUp(mouseButton: Mouse.leftButton)
    }
    
    open override func rightMouseDown(with event: NSEvent) {
        inputManager.setMouseDown(mouseButton: Mouse.rightButton)
    }
    
    open override func rightMouseUp(with event: NSEvent) {
        inputManager.setMouseUp(mouseButton: Mouse.rightButton)
    }
    
    open override func mouseMoved(with event: NSEvent) {
        inputManager.setMousePosition(event.location(in: self))
    }
}
