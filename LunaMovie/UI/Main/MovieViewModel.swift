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
    
    var backdrop: String {
        return movie.backdropPath
    }
    
    var date: String {
        return movie.releaseDate
    }
    
    var rate: String {
        return "\(movie.voteAverage)"
    }
    
    var overview: String {
        return movie.overview
    }
    
    var id: Int {
        return movie.id
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
