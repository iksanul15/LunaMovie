//
//  HttpRouter.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 06/10/20.
//

import Alamofire

protocol HttpRouter {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    
    func body() throws -> Data?
    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    
    var parameters: Parameters? { return nil }
    var headers: HTTPHeaders? { return nil }
    var baseUrl: String { return "https://api.themoviedb.org/3/" }
    func body() throws -> Data? { return nil }
    
    func asUrlRequest() throws -> DataRequest {
        var url = try baseUrl.asURL()
        url.appendPathComponent(path)
        
        let request = AF.request(url, method: method, parameters: parameters, headers: headers)
        
        return request
    }
    
    func asUrlRequest(extendedPath: String) throws -> DataRequest {
        var url = try baseUrl.asURL()
        url.appendPathComponent(path + extendedPath)
        
        let request = AF.request(url, method: method, parameters: parameters, headers: headers)
        
        return request
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
//        return try service.request(asUrlRequest())
        return try asUrlRequest()
    }
    
    func request(usingHttpService service: HttpService, extendedPath: String) throws -> DataRequest {
//        return try service.request(asUrlRequest())
        return try asUrlRequest(extendedPath: extendedPath)
    }
}
