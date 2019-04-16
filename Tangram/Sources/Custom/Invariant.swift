//
//  Invariant.swift
//  Tangram
//
//  Created by Jordan Kay on 4/10/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public struct Invariant {
    public init() {}
}

// MARK: -
extension Invariant: Variant {
    public var name: String {
        return ""
    }
}
