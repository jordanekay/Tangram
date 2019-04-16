//
//  NibInspectable.swift
//  Tangram
//
//  Created by Jordan Kay on 4/18/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

public protocol Inspectable: NibLoadable {
    func setInspectableContent(from view: Self)
}

public extension Inspectable {
    func finishLoading(toReplace view: UIView) {
        setInspectableContent(from: view as! Self)
    }
}
