//
//  MovieDetailViewModel.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import Foundation

struct MovieDetailViewModel {
    private let movie: MovieDetail
    
    var title: String {
        return movie.originalTitle.capitalized
    }
    
    var poster: String {
        return movie.posterPath
    }
    
    var backdrop: String {
        return movie.backdropPath
    }
    
    init(movie: MovieDetail) {
        self.movie = movie
    }
}
