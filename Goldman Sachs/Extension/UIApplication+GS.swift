//
//  UIApplication+RightNow.swift
//  RightNow
//
//  Created by Mohanraj on 31/03/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//

import Foundation
import  UIKit


extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    class func setRootViewController(targetVc : UIViewController){
        let navigationController = UINavigationController(rootViewController: targetVc)
        appDelegate?.window?.rootViewController = navigationController
        //appDelegate?.window?.makeKeyAndVisible()
    }
}
