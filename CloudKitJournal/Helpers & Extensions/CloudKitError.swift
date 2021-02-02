//
//  CloudKitError.swift
//  CloudKitJournal
//
//  Created by Omri Horowitz on 2/1/21.
//  Copyright © 2021 Zebadiah Watson. All rights reserved.
//

import Foundation

enum CloudKitError: LocalizedError {
    case ckError(Error)
    case unableToUnwrap
}
