//
//  NibCustomLoadable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/18/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol NibCustomLoadable: NibLoadable, Custom {
    typealias LoadedVariant = CustomVariant
    
    func setupOutletContent(for variant: LoadedVariant)
}

public extension NibCustomLoadable {
    func setupOutletContent(for variant: LoadedVariant) {
        return
    }
}

public extension NibCustomLoadable where LoadedVariant: RawRepresentable, LoadedVariant.RawValue == String {
    func replacementViewLoadedFromNib(byInterfaceBuilder: Bool) throws -> NibLoadable {
        guard let variant = variant else { throw NibError.invalidVariantName }
        return try! Self.viewLoadedFromNib(of: variant, byInterfaceBuilder: byInterfaceBuilder)
    }
    
    func setupOutletContent() {
        setupOutletContent(for: variant!)
    }
}

extension NibCustomLoadable where LoadedVariant: RawRepresentable, LoadedVariant.RawValue == String {
    var variant: LoadedVariant? {
        return variantName.map(LoadedVariant.init) ?? Self.defaultVariant
    }
}

private extension NibCustomLoadable {
    var variantName: String? {
        return restorationIdentifier?.lowercased()
    }
}
