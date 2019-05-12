//
//  NibLoadable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/3/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol NibLoadable: UIView {
    func replacementViewLoadedFromNib(byInterfaceBuilder: Bool) throws -> NibLoadable
    func finishLoading(toReplace view: UIView)
    func setupOutletContent()
}

// MARK: -
public extension NibLoadable {
    func replacementViewLoadedFromNib(byInterfaceBuilder: Bool) throws -> NibLoadable {
        let variant = Invariant()
        return try Self.viewLoadedFromNib(of: variant, byInterfaceBuilder: byInterfaceBuilder)
    }

    func finishLoading(toReplace view: UIView) {
        return
    }
    
    func setupOutletContent() {
        return
    }

    static func hostedView(of variant: Variant) -> UIView {
        let view = try! viewLoadedFromNib(of: variant, byInterfaceBuilder: false)
        view.restorationIdentifier = variant.name
        return view
    }
}

// MARK: -
extension NibLoadable {
    static func viewLoadedFromNib(of variant: Variant, byInterfaceBuilder: Bool) throws -> NibLoadable {
        let resource = String(describing: self) + variant.name
        let bundle = Bundle(for: self)
        let path = bundle.path(forResource: resource, ofType: "nib")
        guard path != nil else { throw NibError.notFound }
        
        let nib = UINib(nibName: resource, bundle: bundle)
        let topLevelObjects = nib.instantiate(withOwner: nil, options: nil)
        guard let view = topLevelObjects.first as? Self else { throw NibError.contentsInvalid }
        
        view.translatesAutoresizingMaskIntoConstraints = byInterfaceBuilder
        view.setupOutletContent()
        return view
    }
}
