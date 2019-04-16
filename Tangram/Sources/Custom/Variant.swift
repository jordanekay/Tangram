//
//  Variant.swift
//  Tangram
//
//  Created by Jordan Kay on 4/10/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol Variant {
    var name: String { get }
}

// MARK: -
public extension Variant where Self: RawRepresentable, RawValue == String {
    var name: String {
        return rawValue.capitalized
    }
}
