//
//  MovieViewModel.swift
//  MoodMovies
//
//  Created by Emre Tekin on 12.01.2023.
//

import Foundation

protocol MovieViewModelProtocol {
    var delegate: MovieViewModelDelegate? { get set }
    func fetchMovies()
    func getMovieCount() -> Int
    func getMovie(at index: Int) -> MovieModel?
    func getMovieId(at index: Int) -> Int?
}

protocol MovieViewModelDelegate: AnyObject {
    func moviesLoaded()
}

final class MovieViewModel: MovieViewModelProtocol {

    weak var delegate: MovieViewModelDelegate?
    private var movies: [MovieModel]?
    
    func fetchMovies() {
        MovieDBClient.getPopularMovies { [weak self] movies, error in
            guard let self = self else { return }
            self.movies = movies
            self.delegate?.moviesLoaded()
        }
    }
    
    func getMovieCount() -> Int {
        movies?.count ?? 0
    }
    
    func getMovie(at index: Int) -> MovieModel? {
        movies?[index]
    }
    
    func getMovieId(at index: Int) -> Int? {
        movies?[index].id
    }
}


