//
//  MethodHelper.swift
//  LNDR
//
//  Created by SaranRaj on 12/06/19.
//  Copyright © 2019 SaranRaj. All rights reserved.
//
import Foundation
import Alamofire
import UIKit


class APIManager : NSObject {
    
    /*** Singleton APIManager object to be used throughout the app ***/
    static let shared = APIManager()
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    private var isRefreshing = false


    
    public func requestAPI<T : Decodable>(router : APIRouter, completion: @escaping (Swift.Result<T, Error>) -> (Void)) {
        
        if !isNetworkReach{
            completion(.failure(ErrorsToThrow.NoInternet))
            return
        }
        print("Url --->",router.urlRequest?.description ?? "No URL")
//        print("Header --->",router.headers ?? "No Header")
        if let body = router.httpBodoy {
            print("Body --->",dataToJSON(data: body) ?? "No Body")
        }
        
        print("Params --->",router.parameters?.jsonString() ?? "No Params")
        
        
        
        
        
        AF.request(router).validate().responseDecodable { (response : AFDataResponse<T>) in
            DispatchQueue.main.async {
                
                if let responseData = response.data {
                    print("Response --->",dataToJSON(data: responseData) ?? "")
                    
                    /* If the token is valid go for ususual flow */
                    JSONResponseDecoder.decodeFrom(responseData, returningModelType: T.self, completion: { (model, error) in
                        DispatchQueue.main.async {
                            if let parserError = error {
                                completion(.failure(parserError))
                                return
                            }
                            
                            if let model = model {
                                 completion(.success(model))
                                return
                            }
                        }
                    })
                    
                } else if let parserError = response.error {
                    completion(.failure(parserError))
                    return
                }
            }
        }
    }
}




private func dataToJSON(data: Data) -> Any? {
    do {
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    } catch let myJSONError {
        print(myJSONError)
    }
    return nil
}




