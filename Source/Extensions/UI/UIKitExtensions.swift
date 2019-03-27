//
//  UIKitExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Max Rozdobudko on 3/22/19.
//

import UIKit

// MARK: - UIViewController

/// Adds methods for instantiation the View Controller from a Storyboard
public extension UIViewController {

    class var storyboardIdentifier: String {
        return String(describing: self)
    }

    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiateViewController(of: self, from: storyboard)
    }

    class func instantiate(fromStoryboardWithName name: String) -> Self {
        return instantiate(from: UIStoryboard(name: name, bundle: nil))
    }

    private class func instantiateViewController<T: UIViewController>(of type: T.Type, from storyboard: UIStoryboard) -> T {
        if let controller = storyboard.instantiateViewController(withIdentifier: type.storyboardIdentifier) as? T {
            return controller
        } else {
            return T()
        }
    }

}

/// Adds methods for showing alerts
public extension UIViewController {

    func showAlert(withTitle title: String?, message: String?) {
        showAlert(withTitle: title, message: message, handler: nil)
    }

    func showAlert(withTitle title: String?, message: String?, handler: ((UIAlertAction) -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: handler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    func showAlert(withError error: Error, handler: ((UIAlertAction) -> ())? = nil) {
        showAlert(withTitle: "Error", message: error.localizedDescription, handler: handler)
    }

}

// MARK: - UICollectionView

public extension UICollectionView {

    func register<T: UICollectionViewCell>(nib: UINib, forCellWithType type: T.Type) {
        register(nib, forCellWithReuseIdentifier: type.reusableIdentifier)
    }

    func register<T: UICollectionViewCell>(nibForCellWithType type: T.Type) {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: nil)
        register(nib: nib, forCellWithType: type)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.reusableIdentifier, for: indexPath) as? T
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withType: type, for: indexPath)!
    }

}

// MARK: - UICollectionViewCell

public extension UICollectionViewCell {

    class var reusableIdentifier: String {
        return String(describing: self)
    }

    class func nib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: reusableIdentifier, bundle: bundle)
    }

}

// MARK: - UITableView

public extension UITableView {

    func register<T: UITableViewCell>(nib: UINib, forCellWithType type: T.Type) {
        register(nib, forCellReuseIdentifier: type.reusableIdentifier)
    }

    func register<T: UITableViewCell>(nibForCellWithType type: T.Type) {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: nil)
        register(nib: nib, forCellWithType: type)
    }

    func dequeueReusableCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.reusableIdentifier, for: indexPath) as? T
    }

    func dequeueReusableCell<T: UITableViewCell>(withType type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withType: type, for: indexPath)!
    }

    func dequeueDefaultReusableCell(withIdentifier identifier: String = "defaultReusableCell") -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
    }

    var lastSection: Int {
        return numberOfSections - 1
    }

    func isLast(section: Int) -> Bool {
        return section == lastSection
    }

    func lastRow(inSection section: Int) -> Int {
        return numberOfRows(inSection: section) - 1
    }

    func isLast(row: Int, inSection section: Int) -> Bool {
        return lastRow(inSection: section) == row
    }

}

// MARK: - UITableViewCell

public extension UITableViewCell {

    class var reusableIdentifier: String {
        return String(describing: self)
    }

    class func nib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: reusableIdentifier, bundle: bundle)
    }

}
