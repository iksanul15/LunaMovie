//
//  MovieService.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import RxSwift

class MovieService {
    
    private var httpService = MovieHttpService()
    static let shared: MovieService = MovieService()
    
}

extension MovieService: MovieAPI {
    func fetchPopularMovie() -> Observable<[Movie]> {
        return Observable.create { [httpService] (observer) -> Disposable in
            
            do {
                try MovieHttpRouter.getPopularMovie
                    .request(usingHttpService: httpService)
                    .responseJSON{ (result) in
                        guard let data = result.data else { return }
                        do {
                            let movieResponse = try JSONDecoder().decode(ResponseSerialize<[Movie]>.self, from: data)
                            
                            observer.onNext(movieResponse.results ?? [])
                        } catch {
                            observer.onError(error)
                        }
                    }
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create{ }
        }
    }
    
    
}
