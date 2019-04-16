//
//  VariableDisplaying.swift
//  Tangram
//
//  Created by Jordan Kay on 4/19/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol CustomDisplaying: Displaying, Custom {
    typealias DisplayVariant = CustomVariant
    
    func display(_ model: Model, with variant: DisplayVariant)
}

public extension CustomDisplaying where Self: NibCustomLoadable, DisplayVariant: RawRepresentable, DisplayVariant.RawValue == String {
    func display(_ model: Model) {
        display(model, with: variant!)
    }
}
