//
//  HomeViewModel.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import Foundation

protocol HomeViewModel {
    func getNasaDetailsFromSerer(completion: @escaping (NasaModel) -> Void,error: @escaping (Error) -> Void)
    
    var getImageURL : String {get}
    var getTitle : String {get}
    var getExplanation : String {get}
    var getDate : String {get}
    var setDate : String {get set}
}

class HomeViewModelImpl : HomeViewModel {
    
    private let service: HomeService
    private var model : NasaModel?

   
    
    init(service: HomeService = HomeServiceImpl()) {
        self.service = service
    }
    
    var setDate: String = ""

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

    func getNasaDetailsFromSerer(completion: @escaping (NasaModel) -> Void,error: @escaping (Error) -> Void)
    {
        let objRequest = NasaRequest(api_key: "nlIKeCIEn7RUlkYJ8E8sLyXZikoBOgieTj832YiT", date: "2022-01-01")
        guard let requestParam = objRequest.getDictionary() else { return }
        service.getNasaDetails(parameter: requestParam) { (result) in
            switch result{
            case .success(let response):
                self.model = response
                completion(response)
                break;
            case .failure(let failure):
                print(failure.localizedDescription)
                break
            }
        }
    }
}
