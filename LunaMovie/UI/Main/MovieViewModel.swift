//
//  MovieViewModel.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

struct MovieViewModel {
    
    private let movie: Movie
    
    var title: String {
        return movie.originalTitle.capitalized
    }
    
    var poster: String {
        return movie.posterPath
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
