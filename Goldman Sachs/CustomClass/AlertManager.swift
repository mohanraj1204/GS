//
//  AlertManager.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 27/01/22.
//

import Foundation
import UIKit

class AlertManager{
    static let shared = AlertManager()
    let delayTime = 3.0
    
   
    
    func showAlertWithAction(optionTxt : String,message : String, action : ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: LSString(.AppName), message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction.init(title: optionTxt, style: .default, handler: action)
        alertController.addAction(okAction)
        alertController.view.tintColor = AppColor.Orange
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func showAlert(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: LSString(.AppName), message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.view.tintColor = AppColor.Orange
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithCancelAndOkAction(option1Txt : String, option2ndTxt : String,message : String, option1TxtAction : ((UIAlertAction) -> Void)?, option2ndAction : ((UIAlertAction) -> Void)?) {
           let alertController = UIAlertController(title: LSString(.AppName), message: message, preferredStyle: UIAlertController.Style.alert)
           alertController.view.tintColor = AppColor.Orange
           let cancelAction = UIAlertAction.init(title: option1Txt, style: .default, handler: option1TxtAction)
           alertController.addAction(cancelAction)
           let okAction = UIAlertAction.init(title: option2ndTxt, style: .default, handler: option2ndAction)
           alertController.addAction(okAction)
           UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
}

