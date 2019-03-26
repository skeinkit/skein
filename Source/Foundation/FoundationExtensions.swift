//
//  FoundationExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Max Rozdobudko on 3/22/19.
//

import Foundation

// MARK: - String extensions

extension String {

    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

    var decimalDigits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }

}
