//
//  LocalizableClass.swift
//  RightNow
//
//  Created by Mohanraj on 31/03/20.
//  Copyright © 2020 TwilightITSolution. All rights reserved.
//

import Foundation

enum StringKey: String{
    
    case AppName = "AppName"
    case DontHaveAccount = "DontHaveAccount"
    case SignUp = "SignUp"
    case ResetPassword = "ResetPassword"
    case EmailId = "EmailId"
    case MobileNo = "MobileNo"
    case Cancel = "Cancel"
    case Ok = "Ok"
    case LocationDisabled = "LocationDisabled";
    case NeedLocationAccess = "NeedLocationAccess"
    case GotoSettings = "GotoSettings"
    case RightNowUpdate = "RightNowUpdate"
    case RightNowUpdateContent = "RightNowUpdateContent"
    case InstallNow = "InstallNow"
    case NoThanks = "NoThanks"
    case CommingSoon = "CommingSoon"
    case LogOut = "LogOut"
    case EnterEmailOrPhone = "EnterEmailOrPhone"
    case NotValidEmail = "NotValidEmail"
    case EnterPassword = "EnterPassword"
    case StartTimeNotUpdate = "StartTimeNotUpdate"
    case WorkingDayNotChoosed = "WorkingDayNotChoosed"
    case StartOrEndDateIsNotUpdate = "StartOrEndDateIsNotUpdate"
    case PleaseWait = "PleaseWait"
    case NoInternet = "NoInternet"
    
    case UserNameIsNotValid = "UserNameIsNotValid"
    case PhoneNoIsNotValid = "PhoneNoIsNotValid"
    case ZipCodeIsNotValid = "ZipCodeIsNotValid"
    case PasswordIsNotValid = "PasswordIsNotValid"
    case ConfrimPassIsNotValid = "ConfrimPassIsNotValid"
    case PassConfirmPasswordNotSame = "PassConfirmPasswordNotSame"
    
    case BusinessNameIsNotValid = "BusinessNameIsNotValid"
    case BusinessTypeIsNotValid = "BusinessTypeIsNotValid"
    case BusinessInfoIsNotValid = "BusinessInfoIsNotValid"
    case BusinessServiceIsNotValid = "BusinessServiceIsNotValid"
    case BusinessTimeIsNotValid = "BusinessTimeIsNotValid"
    case BusinessLocationIsNotValid = "BusinessLocationIsNotValid"
    case BusinessDocumentIsNotValid = "BusinessDocumentIsNotValid"
    case EmptyField = "EmptyField"
    case ServiceDiscoutCostNotValid = "ServiceDiscoutCostNotValid"
    case DiscriptionIsNotValid = "DiscriptionIsNotValid"
    case ProfileImgIsNotValid = "ProfileImgIsNotValid"
    case ChooseNotCategroy = "ChooseNotCategroy"
    case AccountConfirmAccountNotValid = "AccountConfirmAccountNotValid"
    case NoResultFound = "NoResultFound"
    case ResetPasswordSucess = "ResetPasswordSucess"
    case AccountInfoNotUpdated = "AccountInfoNotUpdated"
    case BusinessNotUpdated = "BusinessNotUpdated"
    case SignInSucessfull = "SignInSucessfull"
    case DeleteService = "DeleteService"
    case AuthorizationFailed = "AuthorizationFailed"
    case DeleteLastSerivice = "DeleteLastSerivice"
    case Date = "Date"
    case Time = "Time"
    case WebisteIsEmpty = "WebisteIsEmpty"
    case NoReview = "NoReview"
    case NoCustomer = "NoCustomer"
    case NoPayment = "NoPayment"
    case DiscountIsHigher = "DiscountIsHigher"
    case NoLastActivity = "NoLastActivity"
    case Done = "Done"
    case Delete = "Delete"
    case SubCategoryDosntFails = "SubCategoryDosntFails"
    case EmailNotVerified = "EmailNotVerified"
    case StartTimeNotChoosed = "StartTimeNotChoosed"
    case EstimationTimeNotChoosed = "EstimationTimeNotChoosed"
    case ResendEmail = "ResendEmail"
    case CantAddBankAccount = "CantAddBankAccount"
    case DeleteBankAccount = "DeleteBankAccount"
    case CantChooseMoreThan2ParentCategory = "CantChooseMoreThan2ParentCategory"
    case Description = "Description (optional)" 
    case ChatNotFound = "ChatNotFound"
    case ChatUnavailble = "ChatUnavailble"
    case AddressNotFound = "AddressNotFound"
    case UpdateService = "UpdateService"
    case AddService = "AddService"
    case JustNow = "JustNow"
    case BusinessIsActivated = "BusinessIsActivated"
    case BusinessIsUnActivated = "BusinessIsUnActivated"
    case NoBankInfo = "NoBankInfo"
    case Skip = "Skip"
    case NotValidAddres = "NotValidAddres"
    case PasswordValidation = "PasswordValidation"
    case TermsAndConditionValidation = "TermsAndConditionValidation"
    case TermsAndCondition = "TermsAndCondition"
    

    
    public var indentifier : String {
        
        if let path = Bundle.main.path(forResource: "en-GB", ofType: "lproj") {
            if let _ = Bundle(path: path) {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
        return self.rawValue
    }
}


func LSString(_ key : StringKey) -> String{
    return key.indentifier
}
