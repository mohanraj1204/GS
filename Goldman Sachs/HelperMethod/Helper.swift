//
//  Helper.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import Foundation
import UIKit

class Helper {
    static let shared = Helper()
    
    public func setupAPP()  {
        ConnectionManager.sharedInstance.observeReachability()
        self.setupIntialLandingScreen()
        self.setupNavigationBar()
    }
    
    private func setupIntialLandingScreen()  {
        let destinationVC = HomeVC(nibName: HomeVC.NibName, bundle: nil)
        UIApplication.setRootViewController(targetVc: destinationVC)
    }
    
    public func getInitialLandingVC() -> UINavigationController {
        let destinationVC = HomeVC(nibName: HomeVC.NibName, bundle: nil)
        let nav = UINavigationController(rootViewController: destinationVC)
        return nav
    }
    
      private func setupNavigationBar(){
//          UINavigationBar.appearance().backgroundColor = UIColor.blue
//        UINavigationBar.appearance().isTranslucent = true
//        UINavigationBar.appearance().barStyle = .default
//        UINavigationBar.appearance().tintColor = AppColor.Orange
//
//        //Set Navigation Title Font
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: AppFont.RobotoBold[18.0], NSAttributedString.Key.foregroundColor:AppColor.Orange]
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: AppFont.RobotoBold[18.0]
//            , NSAttributedString.Key.foregroundColor:AppColor.Orange], for: .normal)
          UINavigationBar.appearance().barTintColor = .black
          UINavigationBar.appearance().tintColor = .white
          UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          UINavigationBar.appearance().isTranslucent = false

      }
    
  
    
    public func showAlert(title: String = AppInfo.appName, message: String,okText : String? = nil,cancelText:String? = nil,Ok completionForOk: (() -> Void)? = nil,Cancel completionForCancel: (() -> Void)? = nil) {
        
        DispatchQueue.main.async {
            let okTextValue = okText ?? LSString(.Ok)
            let cancelTextValue = cancelText ?? LSString(.Cancel)
            
            let alert = UIAlertController(title: title, message: message,  preferredStyle: .alert)
            if cancelText != nil
            {
                alert.addAction(UIAlertAction(title: cancelTextValue, style: .default, handler: { action in
                    if let completionForCancel = completionForCancel {
                        completionForCancel()
                    }
                }))
            }
            
            alert.addAction(UIAlertAction(title: okTextValue, style: .default, handler: { action in
                if let completionForOk = completionForOk {
                    completionForOk()
                }
            }))
            alert.view.tintColor = AppInfo.themeColor
            
            if let topController = UIApplication.topViewController() {
                topController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    public func clearAllUserDefaultData() {
        //remove user default
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
 
    func handlePushNotificationDidSelected(notificaitonObj : [AnyHashable : Any]){
        guard let fcmID = notificaitonObj["fcmId"] as? String else {
            return
        }
    }

    func handleWillPresent(notificaitonObj : [AnyHashable : Any]) -> Bool{
        guard let fcmID = notificaitonObj["fcmId"] as? String else {
            return true
        }
        return true
    }
 
}
