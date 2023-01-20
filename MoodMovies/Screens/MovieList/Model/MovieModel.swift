//
//  MovieModel.swift
//  MoodMovies
//
//  Created by Emre Tekin on 12.01.2023.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let title: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
    }
}
