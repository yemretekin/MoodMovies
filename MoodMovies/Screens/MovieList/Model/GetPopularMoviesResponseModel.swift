//
//  GetPopularMoviesResponseModel.swift
//  MoodMovies
//
//  Created by Emre Tekin on 20.01.2023.
//

import Foundation

struct GetPopularMoviesResponseModel: Decodable {
    let results: [MovieModel]
}
