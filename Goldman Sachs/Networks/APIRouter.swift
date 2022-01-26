//
//  MethodHelper.swift
//  LNDR
//
//  Created by SaranRaj on 12/06/19.
//  Copyright © 2019 SaranRaj. All rights reserved.
//

import Foundation
import Alamofire

/*** API Router Enum to prepare URL Request ***/
public enum APIRouter : URLRequestConvertible {
    
    case getNasaDetails(param : [String : Any])
    
    /*** Enum to change Environment ***/
    enum EnvironmentType {
        case Production

        var baseURLWithoutAuth : String {
            switch self {
            case .Production:
                return "https://api.nasa.gov/planetary/"
            }}
           }
    
    /*** Request Headers ***/
    var headers: Dictionary<String, String>? {
        
        set{
        }
        
        get {
            
            switch self {
            case .getNasaDetails :
                return [
                    "Content-Type": "application/json",
                    "type" : "1"
                ]
            }
        }
    }
    
    mutating func udpateHeader(){
        self.headers = self.headers
    }
    
    /*** HTTPMethod Type ***/
    var method: HTTPMethod {
        switch self {
        case .getNasaDetails  :
            return .get
        }
    }
    
    /*** Endpoint Path ***/
    var path: String {
        switch self {
        case .getNasaDetails:
            return "apod"
        }
    }
    
    /*** Parameters to pass in request ***/
    var parameters: Dictionary<String, Any>? {
        switch self {
        case .getNasaDetails(let param):
            return param
        }
    }
    
    var httpBodoy : Data? {
        switch self {
        default:
            return nil
        }
    }
    
    /*** URL encoding for each router ***/
    var encoding: ParameterEncoding{
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    
    /*** URL request to Call API ***/
    public func asURLRequest() throws -> URLRequest {
        
        let url = try self.getBaseUrl().asURL()
        var request : URLRequest = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = 60
        request.httpBody = httpBodoy
        request.allHTTPHeaderFields = headers
        return try encoding.encode(request, with: parameters)
    }
    
    private func getBaseUrl() -> String {
        switch self {
        case .getNasaDetails :
            return currentEnvironment.baseURLWithoutAuth
        }
    }
}

