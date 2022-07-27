//
//  Request.swift
//  APIManager
//
//  Created by Thien Tung on 04/04/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct Request {
    
    /// Init
    public static let shared = Request()
    
    /// Build URL for API
    public func urlRequest(urlString: String) -> URL {
        return URL(string: urlString)!
    }
    
    /// All  Request
    //MARK: -Get Request
    public func sendGetRequest(parameters: [String: AnyObject]?, headers: HTTPHeaders?, urlString: String, completion: @escaping (_ error: ApiError, _ json: JSON) -> Void) {
        let urlRequest = self.urlRequest(urlString: urlString)
        //Alamofire.request
        Alamofire.request(urlRequest,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers)
        .responseJSON { (response) in
            guard response.result.isSuccess else {
                // Return error from server
                completion(.server, JSON.null)
                return
            }
            
            guard let value = response.result.value else {
                // Return error from parse
                completion(.parse, JSON.null)
                return
            }
            // Return value from respone api
            completion(.none, JSON(value))
        }
    }
    
    //MARK: -Post Request
    public func sendPostRequest(parameters: [String: AnyObject]?, headers: HTTPHeaders?, pathURL: String, completion: @escaping (_ error: ApiError, _ json: JSON) -> Void) {
        let urlRequest = self.urlRequest(urlString: pathURL)
        //Alamofire.request
        Alamofire.request(urlRequest,
                          method: .post,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers)
        .responseJSON { (response) in
            guard response.result.isSuccess else {
                // Return error from server
                completion(.server, JSON.null)
                return
            }
            
            guard let value = response.result.value else {
                // Return error from parse
                completion(.parse, JSON.null)
                return
            }
            // Return value from respone api
            completion(.none, JSON(value))
        }
    }
    
    
    //MARK: -Put Request
    public func sendPutRequest(parameters: [String: AnyObject]?, headers: HTTPHeaders?, pathURL: String, completion: @escaping (_ error: ApiError, _ json: JSON) -> Void) {
        let urlRequest = self.urlRequest(urlString: pathURL)
        //Alamofire.request
        Alamofire.request(urlRequest,
                          method: .put,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers)
        .responseJSON { (response) in
            guard response.result.isSuccess else {
                // Return error from server
                completion(.server, JSON.null)
                return
            }
            
            guard let value = response.result.value else {
                // Return error from parse
                completion(.parse, JSON.null)
                return
            }
            // Return value from respone api
            completion(.none, JSON(value))
        }
    }
    
    
    //MARK: -Del Request
    public func sendDelRequest(parameters: [String: AnyObject]?, headers: HTTPHeaders?, pathURL: String, completion: @escaping (_ error: ApiError, _ json: JSON) -> Void) {
        let urlRequest = self.urlRequest(urlString: pathURL)
        //Alamofire.request
        Alamofire.request(urlRequest,
                          method: .delete,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers)
        .responseJSON { (response) in
            guard response.result.isSuccess else {
                // Return error from server
                completion(.server, JSON.null)
                return
            }
            
            guard let value = response.result.value else {
                // Return error from parse
                completion(.parse, JSON.null)
                return
            }
            // Return value from respone api
            completion(.none, JSON(value))
        }
    }
    
}


