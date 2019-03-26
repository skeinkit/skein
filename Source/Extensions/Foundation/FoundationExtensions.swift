//
//  FoundationExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Max Rozdobudko on 3/22/19.
//

import Foundation

// MARK: - String Extensions

public extension String {

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

// MARK: - Date Extensions

public extension Date {
    var isInPast: Bool {
        let now = Date()
        return self.compare(now) == ComparisonResult.orderedAscending
    }
}

// MARK: - Dictionary Extensions

public extension Dictionary where Dictionary.Key == String {

    func string(for key: String, default: String) -> String {
        return (self[key] as? String) ?? `default`
    }

    func string(for key: String) -> String? {
        return self[key] as? String
    }

    func int(for key: String) -> Int? {
        return self[key] as? Int
    }

    func bool(for key: String) -> Bool? {
        return self[key] as? Bool
    }

    func bool(for key: String, default: Bool) -> Bool {
        if let value = bool(for: key) {
            return value
        } else {
            return `default`
        }
    }

}

// MARK: - Array

public extension Array where Iterator.Element: Equatable {

    @discardableResult
    mutating func remove(element: Iterator.Element) -> Iterator.Element? {
        guard let index = self.index(of: element) else {
            return nil
        }
        return remove(at: index)
    }

}

public extension Array where Iterator.Element: Equatable {

    func before(element: Iterator.Element) -> Iterator.Element? {
        guard let index = self.index(of: element) else {
            return nil
        }
        guard index > self.startIndex else {
            return nil
        }
        return self[self.index(before: index)]
    }

    func after(element: Iterator.Element) -> Iterator.Element? {
        guard let index = self.index(of: element) else {
            return nil
        }
        guard index < self.endIndex else {
            return nil
        }
        return self[self.index(after: index)]
    }

}

// MARK: - URL

public extension URL {

    init?(string: String?) {
        if let string = string {
            self.init(string: string)
        } else {
            return nil
        }
    }

}
