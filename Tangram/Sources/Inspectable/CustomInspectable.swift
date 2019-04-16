//
//  CustomInspectable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/19/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol CustomInspectable: NibCustomLoadable, Inspectable {
    func setInspectableContent(from view: Self, for variant: CustomVariant)
}

public extension CustomInspectable where CustomVariant: RawRepresentable, CustomVariant.RawValue == String {
    func setInspectableContent(from view: Self) {
        setInspectableContent(from: view, for: variant!)
    }
}
