//
//  Constants.swift
//  PokedexMVC
//
//  Created by BSAL-MAC on 9/2/20.
//  Copyright © 2020 BSAL-MAC. All rights reserved.
//

import UIKit

struct Images {
    static let covid = UIImage(named: "covid")!
    static let notification = UIImage(named: "notification")!
    static let number = UIImage(named: "number")!
}

extension UIApplication {    // UIApplication.topViewController()?.navigationController?.popToViewController(yourController,animated: true)

    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {


            return topViewController(controller: presented)
        }
        return controller
    }
}


extension UIImage {
  static func named(_ name: String) -> UIImage {
    if let image = UIImage(named: name) {
      return image
    } else {
      fatalError("Could not initialize \(UIImage.self) named \(name).")
    }
  }
}

extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
