//
//  DisplayVariable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/16/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol Displaying: NibLoadable {
    associatedtype Model

    func display(_ model: Model)
}
