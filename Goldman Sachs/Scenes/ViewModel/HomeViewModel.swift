//
//  HomeViewModel.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import Foundation

protocol HomeViewModel {
    func getNasaDetailsFromSerer(completion: @escaping (NasaModel) -> Void,error: @escaping (Error) -> Void)
    func setFavUnFav(completion: @escaping () -> Void)
    
    var getImageURL : String {get}
    var getTitle : String {get}
    var getExplanation : String {get}
    var getDate : String {get}
    var setDate : String? {get set}
    var getFav : String {get}
}

class HomeViewModelImpl : HomeViewModel {
    
    private let service: HomeService
    private var model : NasaModel?

   
    
    init(service: HomeService = HomeServiceImpl()) {
        self.service = service
    }
    
    var setDate: String?

    var getImageURL: String {
        return model?.url ?? ""
    }
    
    var getTitle: String{
        return model?.title ?? ""
    }
    
    var getExplanation: String {
        return model?.explanation ?? ""
    }
    
    var getDate: String {
        return model?.date ?? ""
    }
    
    var getFav: String {
        let isFav = arrFavList.contains { obj in
            if(obj.date == self.model?.date){
                return true
            }
            return false
        }
       return isFav ? "Fav" : "UnFav"
    }

    func getNasaDetailsFromSerer(completion: @escaping (NasaModel) -> Void,error: @escaping (Error) -> Void)
    {
        let dateOfSearch = setDate ?? self.getTodayDate()
        self.setDate = dateOfSearch
        let objRequest = NasaRequest(api_key: "nlIKeCIEn7RUlkYJ8E8sLyXZikoBOgieTj832YiT", date: dateOfSearch)
        guard let requestParam = objRequest.getDictionary() else { return }
        service.getNasaDetails(parameter: requestParam) { (result) in
            switch result{
            case .success(let response):
                if (response.date?.count ?? 0) > 0 {
                    self.model = response
                    //Save response to the local
                    UserDefaults.standard.set(encodable: self.model, forKey: UserdefaultKey.of.nasaPreviousDetails)
                    completion(response)
                } else {
                    AlertManager.shared.showAlert(msg: "No Data Found on this specified date!")
                }
                break;
            case .failure(let failure):
                print(failure.localizedDescription)
                if let obj = UserDefaults.standard.value(NasaModel.self, forKey: UserdefaultKey.of.nasaPreviousDetails) {
                    if((obj.date?.count ?? 0) > 0){
                        self.model = obj
                        completion(obj)
                    }
                }
                
                break
            }
        }
    }
    
    private func getTodayDate() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           return dateFormatter.string(from: Date())
    }
       
    
    func setFavUnFav(completion: @escaping () -> Void) {
        let indexValue = arrFavList.firstIndex(where: { (objNasa) -> Bool in
            if objNasa.date == self.model?.date {
                return true
            }
            return false
        })
        if((indexValue ?? -1) > -1){
            arrFavList.remove(at: indexValue ?? 0)
        } else {
            if let obj = self.model{
                arrFavList.append(obj)
            }
        }
     completion()
    }
}
   


