//
//  FoundationExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Max Rozdobudko on 3/22/19.
//

import Foundation
import ReactiveSwift
import Result

// MARK: - Signal Extensions

public extension Signal {
    
    /// Repeats the latest value from `self` whenever `repeater` sends a `value`
    /// event.
    ///
    /// - parameters:
    ///   - repeater: A signal that will trigger the delivery of `value` event
    ///              from `self`.
    ///
    /// - returns: A signal that will send values from `self`, repeated (possibly
    ///            multiple times) by `repeater`, then complete once both input
    ///            signals have completed, or interrupt if either input signal
    ///            is interrupted.
    func `repeat`(on repeater: Signal<(), NoError>) -> Signal<Value, Error> {
        return combineLatest(with: repeater.promoteError(Error.self)).map { $0.0 }
    }
}