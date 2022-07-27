//
//  RestManager.swift
//  HappyMod
//
//  Created by MacOne-YJ4KBJ on 11/07/2022.
//

import Foundation
import APIManager

class RestManager {
    static let shared = RestManager()
    
    func getGenres(param: [String: AnyObject]?, completion: @escaping (([CategoriesData]) -> Void)){
        Request.shared.sendGetRequest(parameters: param, headers: nil, urlString: API.BASE_URL_CATEGORIES) { error, json in
            switch error {
            case .server:
                completion([])
            case .parse:
                completion([])
            case .none:
                let data = json["data"].arrayValue
                let arraydata = data.map({CategoriesData($0)})
                completion(arraydata)
            }
        }
    }
    
    func getItemGenres(param: [String: AnyObject]?, completion: @escaping (([DataItemCategories]) -> Void)){
        Request.shared.sendGetRequest(parameters: param, headers: nil, urlString: API.BASE_SEARCH) { error, json in
            switch error {
            case .server:
                completion([])
            case .parse:
                completion([])
            case .none:
                let data = json["data"].arrayValue
                let arraydata = data.map({DataItemCategories($0)})
                completion(arraydata)
            }
        }
    }
}
