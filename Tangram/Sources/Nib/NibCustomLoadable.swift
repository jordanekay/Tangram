//
//  NibCustomLoadable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/18/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol NibCustomLoadable: NibLoadable, Custom {
    typealias LoadedVariant = CustomVariant
}

public extension NibCustomLoadable where LoadedVariant: RawRepresentable, LoadedVariant.RawValue == String {
    var variant: LoadedVariant {
        return variantName.flatMap(LoadedVariant.init) ?? Self.defaultVariant
    }
    
    func replacementViewLoadedFromNib(byInterfaceBuilder: Bool) throws -> NibLoadable {
        return try! Self.viewLoadedFromNib(of: variant, byInterfaceBuilder: byInterfaceBuilder)
    }
}

private extension NibCustomLoadable {
    var variantName: String? {
        return restorationIdentifier?.lowercased()
    }
}
