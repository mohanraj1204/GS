//
//  ConectionManger.swift
//  RightNow
//
//  Created by Mohanraj on 19/05/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//

import Foundation
import UIKit
import Reachability

var isNetworkReach = true

class ConnectionManager {
    
    static let sharedInstance = ConnectionManager()
    private var reachability : Reachability!
    
    func observeReachability(){
        self.reachability = try? Reachability()
        NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .cellular:
            isNetworkReach = true
            break
        case .wifi:
            isNetworkReach = true
            break
        case .none:
            isNetworkReach = false
            break
        case .unavailable:
            isNetworkReach = false
        }
    }
}

