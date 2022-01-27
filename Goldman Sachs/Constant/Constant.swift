//
//  Constant.swift
//  RightNow
//
//  Created by Mohanraj on 31/03/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate
var currentEnvironment : APIRouter.EnvironmentType = .Production
var arrFavList : [NasaModel] = []

//MARK:-App Info
struct AppInfo {
    static let appName = "Goldman Sachs"
    static let AppstoreID = ""
    static let conatctNumber = "+91 8122782505"
    static let themeColor = "1AA1B9".hexToUIColor()
    static let google_Key = ""
}

struct AppColor {
    static let AppTheme = "0052E1".hexToUIColor()
    static let PlaceHolderBlack = "3D3D3D".hexToUIColor()
    static let LiteBlue = "666FFC".hexToUIColor()
    static let DarkBlue = "2A7FE0".hexToUIColor()
    static let Orange = "F1592D".hexToUIColor()
    static let Black = "000000".hexToUIColor()
    static let Yellow = "FFC05C".hexToUIColor()
    static let Red = "FF3857".hexToUIColor()
    static let PlaceHoderBottomLine = "908F8F".hexToUIColor()
    static let TxtfieldBgWhite = "FFFFFF".hexToUIColor()
    static let StarFilled = "25AAE1".hexToUIColor()
    static let StarUnFilled = "C4C4C4".hexToUIColor()
    static let TagVwBG = "E8E8E8".hexToUIColor()
    static let TagText = "555555".hexToUIColor()
    static let TextLightGray = "6A6A6A".hexToUIColor()
    static let TextDarkGray = "161616".hexToUIColor()
    static let VwBg = "F5F5F5".hexToUIColor()
    static let GraphGreen = "10881C".hexToUIColor()
    static let GraphBlue = "25AAE1".hexToUIColor()
    static let GraphRed = "F1592D".hexToUIColor()
}

enum AppCharacters : String {
    case RISTRICTED_CHARACTERS = "'*=+[]\\|;:'\",<>/?%"
}


struct APNSType {
    struct Device {
        static var token = "0000000000"
    }
}


struct Mutlipart {
    struct Key {
        static var fileUpload = "file"
    }
}

struct Currency {
    struct OfType {
        static var dollar = "$"
    }
}


let mask = "(XXX) XXX-XXXX"

let pageLimt = 10


enum AppFontType : Int {
    case SpinCycle = 0, RobotoRegular = 1, RobotoBold = 2,RobotoBoldItalic = 3,RobotoMedium = 4
    
    var customFont: AppFont {
        switch self {
        case .SpinCycle:
            return .SpinCycle
        case .RobotoRegular:
            return .RobotoRegular
        case .RobotoBold:
            return .RobotoBold
        case .RobotoBoldItalic:
            return .RobotoBoldItalic
        case .RobotoMedium:
            return .RobotoBoldMedium
            
        }
    }
}

enum AppFont : String {
    case SpinCycle =  "SpinCycle"
    case RobotoRegular = "Roboto-Regular"
    case RobotoBold = "Roboto-Bold"
    case RobotoBoldItalic = "Roboto-BoldItalic"
    case RobotoBoldMedium = "Roboto-Medium"
    
    subscript(size : CGFloat) -> UIFont {
        get {
            return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}

public enum AlertTitle : String{
    case AppName = "Right Now"
    case Warning = "Warning"
    case Success = "Success"
    case Failure = "Failure"
    case Alert = "Alert"
    case Logout = "Log out"
    case Empty = ""
    var indentifier : String {
        return self.rawValue
    }
}

public enum FCMIndentifier : String{
    case AppointmentConfirmed = "AppointmentConfirmed"
    case AppointmentCompleted = "AppointmentCompleted"
    case BusinessActivated = "BusinessActivated"
    case Chat = "Chat"
    var indentifier : String {
        return self.rawValue
    }
}



enum StatusCode :Int{
    case Ok = 200
    case Created = 201
    case Accepted = 202
    case NoContent = 204
    case OtherError = 409
    case BadRequest = 400
    case TokenExpired = 401
    case NotFound = 404
    case MethodNotAllowed = 405
    case InternalServerError = 500
    case Unauthorized = 406
}


public enum ErrorsToThrow: Error,LocalizedError {
    case failed
    case NoInternet
    
    public var errorDescription: String? {
        switch self {
        case .NoInternet:
            return NSLocalizedString(LSString(.NoInternet), comment: "Network Issue")
        default :
            return NSLocalizedString("Internal server error!", comment: "Network Issue")
        }
    }
}



func jsonToData(json: Any) -> Data? {
    do {
        return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
    } catch let myJSONError {
        print(myJSONError)
    }
    return nil;
}




var currentChattingRoomChatID : String = "0"
