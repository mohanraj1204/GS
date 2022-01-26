
//
//  Dictionary+WinqBid.swift
//  WinqBid
//
//  Created by SaranRaj on 16/12/19.
//  Copyright © 2019 SaranRaj. All rights reserved.
//

import Foundation
import UIKit

extension Dictionary
{
    
    func jsonString() -> String{
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else { return "Empty" }
        if let theJSONText = String(data: theJSONData, encoding: String.Encoding.ascii)
        {
            return theJSONText
        }
        return "Empty"
    }
    
    func jsonStringWithNoWhitespace() -> String {
        self.jsonString().filter {!$0.isWhitespace}
    }

    var jsonStringRepresentation: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
            return nil
        }

        return String(data: theJSONData, encoding: .ascii)
    }

}

