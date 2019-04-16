//
//  NibLoadingError.swift
//  Tangram
//
//  Created by Jordan Kay on 4/16/19.
//  Copyright © 2019 CultivR. All rights reserved.
//

enum NibError {
    case notFound
    case contentsInvalid
    case invalidVariantName
}

// MARK: -
extension NibError: Error {}
