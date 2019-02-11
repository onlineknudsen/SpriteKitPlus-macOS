//
//  Protocols.swift
//  SpriteKitPlus
//
//  Created by Lin Knudsen on 7/31/18.
//  Copyright © 2018 Lin Knudsen. All rights reserved.
//

///Conform this protocol if you want your object to be called in the game loop when you add it as a child in the scene
public protocol Updatable {
    func update (deltaTime: TimeInterval)
}

public protocol LateUpdatable {
    func lateUpdate ()
}
