//
//  MovieHttpService.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 06/10/20.
//

import Alamofire

class MovieHttpService: HttpService {
    var sessionManager: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManager.request(urlRequest).validate(statusCode: 200..<400)
    }
    
}
