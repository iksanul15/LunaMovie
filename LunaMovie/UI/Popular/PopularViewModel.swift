//
//  PopularViewModel.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 05/10/20.
//

import RxSwift

class PopularViewModel {
    
    private let movieApi: MovieAPI
    
    init(movieApi: MovieAPI = MovieService()) {
        self.movieApi = movieApi
    }
    
    func fetchPopularMovie() -> Observable<[MovieViewModel]> {
        movieApi.fetchPopularMovie().map { $0.map {
            MovieViewModel(movie: $0)
        } }
    }
    
}
