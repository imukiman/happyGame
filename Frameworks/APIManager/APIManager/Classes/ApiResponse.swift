//
//  ApiResonse.swift
//  APIManager
//
//  Created by Thien Tung on 04/04/2022.
//

import Foundation

// Response
public enum ResponseStatus: String {
    case success                = "SUCCESS"
    case error                  = "ERROR"
}

//MARK: - Api Error
public enum ApiError: String {
    case server                 = "Error while connect to server!"
    case parse                  = "Error while parse data!"
    case none                   = "Undefine error service!"
}
