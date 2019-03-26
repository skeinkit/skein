//
//  UIKitExtensions.swift
//  FBSnapshotTestCase
//
//  Created by Max Rozdobudko on 3/22/19.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {

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

extension UIViewController {

    static func topViewController(_ viewController: UIViewController) -> UIViewController {
        guard let presentedViewController = viewController.presentedViewController else {
            return viewController
        }
        if let navigationController = presentedViewController as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController {
                return topViewController(visibleViewController)
            }
        } else if let tabBarController = presentedViewController as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return topViewController(selectedViewController)
            }
        }
        return topViewController(presentedViewController)
    }

}

extension UIViewController {

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
