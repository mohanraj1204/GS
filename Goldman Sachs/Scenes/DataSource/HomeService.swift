//
//  HomeService.swift
//  Goldman Sachs
//
//  Created by Mohanraj on 26/01/22.
//

import Foundation

protocol HomeService {
    func getNasaDetails(parameter: [String : Any],completion: @escaping (Swift.Result<NasaModel, Error>) -> ())
}


class HomeServiceImpl: HomeService {
    func getNasaDetails(parameter: [String : Any],completion: @escaping (Swift.Result<NasaModel, Error>) -> ()) {
        APIManager.shared.requestAPI(router: APIRouter.getNasaDetails(param: parameter)) { (result) in
            completion(result)
        }
    }
}
