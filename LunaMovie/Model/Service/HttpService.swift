//
//  HttpService.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 06/10/20.
//

import Alamofire

protocol HttpService {
    var sessionManager: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
