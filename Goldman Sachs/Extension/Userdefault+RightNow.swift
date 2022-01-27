//
//  Userdefault+RightNow.swift
//  RightNow
//
//  Created by Mohanraj on 18/04/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//


import Foundation

extension UserDefaults {

    func set<T: Encodable>(encodable: T, forKey key: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            set(data, forKey: key)
        }
    }

    func value<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = object(forKey: key) as? Data,
            let value = try? JSONDecoder().decode(type, from: data) {
            return value
        }
        return nil
    }
    
    
    func save<T:Encodable>(customObject object: T, inKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            self.set(encoded, forKey: key)
        }
    }

    func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
        if let data = self.data(forKey: key) {
            let decoder = JSONDecoder()
            if let object = try? decoder.decode(type, from: data) {
                return object
            }else {
                print("Couldnt decode object")
                return nil
            }
        }else {
            print("Couldnt find key")
            return nil
        }
    }

}

/*
// Save
UserDefaults.standard.set(encodable: Dummy(), forKey: "K1")

// Load
let dummy = UserDefaults.standard.value(Dummy.self, forKey: "K1")
*/


struct UserdefaultKey  {
    struct of {
        static let nasaPreviousDetails = "nasaPreviousDetails"
    }
}
