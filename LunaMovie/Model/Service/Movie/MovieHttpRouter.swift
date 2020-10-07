//
//  MovieHttpRouter.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import Alamofire

enum MovieHttpRouter {
    case getPopularMovie
}

extension MovieHttpRouter: HttpRouter  {
    var path: String {
        switch self {
        case .getPopularMovie:
            return "movie/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPopularMovie:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getPopularMovie:
            let params = [
                "api_key": "9892795f112b7140f1989643d9e9b8d0"
            ]
            return params
        }
    }
        
}
