//
//  Custom.swift
//  Tangram
//
//  Created by Jordan Kay on 4/22/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol Custom {
    associatedtype CustomVariant: Variant
    
    static var defaultVariant: CustomVariant { get }
}
