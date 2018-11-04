//
//  InputManager.swift
//  SpriteKitPlus
//
//  Created by Lin Knudsen on 7/31/18.
//  Copyright © 2018 Lin Knudsen. All rights reserved.
//

import Foundation
import SpriteKit


/**
 Use this class to get the state of keyboard and mouse input. Add this as a child to your game scene.
 ````
 import SpriteKit
 import SpriteKitPlus
 
 class GameScene: SKScene {
    var inputManager = InputManager ()
 
    override func didMove(to view: SKView) {
        addChild(inputManager)
    }
 }
 ````
 - Note: See other methods to learn how to use it
 - Note: Will implement dragging and scrolling support soon
*/
public final class InputManager : SKNode, LateUpdatable {
    
    private var currentKeyStates: [Bool] = [Bool](repeating: false, count: Int(KeyCode.count))
    private var previousKeyStates: [Bool] = [Bool](repeating: false, count: Int(KeyCode.count))
    
    private var currentMouseStates: [Bool] = [Bool](repeating: false, count: 3)
    private var previousMouseStates: [Bool] = [Bool](repeating: false, count: 3)
    
    private(set) var mousePosition : CGPoint = CGPoint()
    
    /// - Parameter keyCode: Key
    /// - Returns: The state of the key
    public func isKeyDown (_ keyCode: UInt16) -> Bool {
        return currentKeyStates[Int(keyCode)]
    }
    
    
    /// - Parameter keyCode: Key
    /// - Returns: If key has been pressed down this frame
    public func isKeyJustPressed (_ keyCode: UInt16) -> Bool {
        let currKeyState = currentKeyStates[Int(keyCode)]
        let prevKeyState = previousKeyStates[Int(keyCode)]
        
        if currKeyState == true && prevKeyState == false {
            return true
        } else {
            return false
        }
    }
    
    /// - Parameter keyCode: Key
    /// - Returns: If key has been released this frame
    public func isKeyJustReleased (_ keyCode: UInt16) -> Bool {
        let currKeyState = currentKeyStates[Int(keyCode)]
        let prevKeyState = previousKeyStates[Int(keyCode)]
        
        if currKeyState == false && prevKeyState == true {
            return true
        } else {
            return false
        }
    }
    
    /// - Parameter mouseButton: Mouse button
    /// - Returns: The state of the mouse button
    public func isMouseButtonDown (_ mouseButton: Int) -> Bool {
        return currentMouseStates[mouseButton]
    }
    
    /// - Parameter mouseButton: Mouse button
    /// - Returns: If the mouse button has been pressed down this frame
    public func isMouseButtonJustDown(_ mouseButton: Int) -> Bool {
        let currMouseState = currentMouseStates[mouseButton]
        let prevMouseState = previousMouseStates[mouseButton]
        
        if currMouseState == true && prevMouseState == false {
            return true
        } else {
            return false
        }
    }
    
    /// - Parameter mouseButton: Mouse button
    /// - Returns: If the mouse button has been released this frame
    public func isMouseButtonJustReleased(_ mouseButton: Int) -> Bool {
        let currMouseState = currentMouseStates[mouseButton]
        let prevMouseState = previousMouseStates[mouseButton]
        
        if currMouseState == false && prevMouseState == true {
            return true
        } else {
            return false
        }
    }
    
    /**
     Updates the input states. It should be called as demonstrated below:
     ````
     class GameScene: SKScene {
        var inputManager = InputManager()
     
        override func didMove(to view: SKView) {
            addChild(inputManager)
        }
        ...
     
        override func didFinishUpdate() {
            children.forEach { ($0 as? LateUpdatable)?.lateUpdate() }
        }
     }
     ````
    */
    public func lateUpdate() {
        previousKeyStates = currentKeyStates
        previousMouseStates = currentMouseStates
    }
    
    /**
     Call this in the `keyDown(with event: NSEvent)`
     ````
     class GameScene: SKScene {
        var inputManager = InputManager()
     
        ...
     
        override func keyDown(with event: NSEvent) {
            inputManager.setKeyDown(event.keyCode)
        }
     }
     ````
    */
    public func setKeyDown(keyCode: UInt16) {
        currentKeyStates[Int(keyCode)] = true
    }
    
    /**
     Call this in the `keyUp(with event: NSEvent)`
     ````
     class GameScene: SKScene {
        var inputManager = InputManager()
     
        ...
     
        override func keyUp(with event: NSEvent) {
            inputManager.setKeyUp(event.keyCode)
        }
     }
     ````
     */
    public func setKeyUp(keyCode: UInt16) {
        currentKeyStates[Int(keyCode)] = false
    }
    
    /**
     Call this in `mouseDown(with event: NSEvent)` and `rightMouseDown(with event: NSEvent)`
     ````
     class GameScene: SKScene {
        var inputManager = InputManager()
        ...
        override func mouseDown(with event: NSEvent) {
            inputManager.setMouseDown(Mouse.left)
        }
     
        override func rightMouseDown(with event: NSEvent) {
            inputManager.setMouseDown(Mouse.right)
        }
     }
     ````
    */
    public func setMouseDown(mouseButton: Int) {
        currentMouseStates[mouseButton] = true
    }
    
    /**
     Call this in `mouseDown(with event: NSEvent)` and `rightMouseDown(with event: NSEvent)`
     ````
     class GameScene: SKScene {
        var inputManager = InputManager()
        ...
        override func mouseUp(with event: NSEvent) {
            inputManager.setMouseUp(Mouse.left)
        }
     
        override func rightMouseUp(with event: NSEvent) {
            inputManager.setMouseUp(Mouse.right)
        }
     }
     ````
     */
    public func setMouseUp(mouseButton: Int) {
        currentMouseStates[mouseButton] = false
    }
    
    
    /**
    Call this in `mouseMoved(with event: NSEvent)`
    ````
    class GameScene: SKScene {
        var inputManager = InputManager()
            ...
        override func mouseMoved(with event: NSEvent) {
            inputManager.setMousePosition(event.location(in: self))
        }
    }
    ````
    */
    public func setMousePosition(_ mousePosition: CGPoint) {
        self.mousePosition = mousePosition
    }
    
}
