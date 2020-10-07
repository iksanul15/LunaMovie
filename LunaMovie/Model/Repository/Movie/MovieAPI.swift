//
//  MovieAPI.swift
//  LunaMovie
//
//  Created by Muhammad Iksanul on 07/10/20.
//

import RxSwift

protocol MovieAPI {
    func fetchPopularMovie() -> Observable<[Movie]>
    func fetchDetailMovie(id: Int) -> Observable<MovieDetail>
}
