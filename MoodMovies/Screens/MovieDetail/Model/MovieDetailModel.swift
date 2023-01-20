//
//  MovieDetailModel.swift
//  MoodMovies
//
//  Created by Emre Tekin on 20.01.2023.
//

import Foundation

struct MovieDetailModel: Decodable {
    let title: String
    let poster: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case tagline
    }
}
