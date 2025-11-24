//
//  NetworkRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

typealias Parameters = [URLQueryItem]

protocol NetworkRouter {
    var httpMethod : HTTPMethod { get }
    var path: String { get }
    var bodyData: Data? { get }
    var urlParams: [URLQueryItem]? { get }
    var contentType: ContentType? { get }
    var autorization: String? { get }
}

extension NetworkRouter {
    
    func asURLRequest() throws -> URLRequest {
        var component = URL.baseURLComponent
        component.path = path
        component.queryItems = self.urlParams
        let url = component.url!
        
        var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 5.0)
        request.httpMethod = httpMethod.rawValue
        
        if let data = self.bodyData {
            request.httpBody = data
        }
        if let content = contentType?.rawValue {
            request.setValue(content, forHTTPHeaderField: "Content-Type")
        }
        if let autorizationString = self.autorization {
            request.addValue(autorizationString, forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    func asURLRequestForImage(url: String) throws -> URLRequest {
        let url = URL(string: url)!
        var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 5.0)
        request.httpMethod = httpMethod.rawValue
        
        if let data = self.bodyData {
            request.httpBody = data
        }
        if let content = contentType?.rawValue {
            request.setValue(content, forHTTPHeaderField: "Content-Type")
        }
        if let autorizationString = self.autorization {
            request.addValue(autorizationString, forHTTPHeaderField: "Authorization")
        }
        return request
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum ContentType: String {
    case jsonPatch  = "application/json-patch+json"
    case json       = "application/json"
    case multiPart  = "multipart/form-data"
    case www = "application/x-www-form-urlencoded"
    case jpeg = "image/jpeg"
}
