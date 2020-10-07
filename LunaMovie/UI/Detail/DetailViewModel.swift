//
//  DetailViewModel.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import RxSwift

class DetailViewModel {
    
    private let movieApi: MovieAPI
    
    init(movieApi: MovieAPI = MovieService()) {
        self.movieApi = movieApi
    }
    
    func fetchDetailMovie(id: Int) -> Observable<MovieDetailViewModel> {
        movieApi.fetchDetailMovie(id: id).map {
            MovieDetailViewModel(movie: $0)
        }
    }
    
}
