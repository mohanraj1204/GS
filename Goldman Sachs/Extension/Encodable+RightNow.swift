//
//  Encodable+RightNow.swift
//  RightNow
//
//  Created by Mohanraj on 05/05/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//

import Foundation

extension Encodable {
    func getDictionary() -> [String: Any]? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any]
        }
    }
}
