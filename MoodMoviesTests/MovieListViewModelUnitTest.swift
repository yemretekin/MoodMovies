//
//  MovieListViewModelUnitTest.swift
//  MoodMoviesTests
//
//  Created by Emre Tekin on 22.01.2023.
//

import XCTest

final class MovieListViewModelUnitTest: XCTestCase {

    var viewModel: MovieViewModel!
    var fetchExpectation: XCTestExpectation!
    
    override func setUpWithError() throws {
        viewModel = MovieViewModel()
        viewModel.delegate = self
        fetchExpectation = expectation(description: "fetchMovies")
    }

    func testGetMovieCount() throws {
        //Given
        XCTAssertEqual(viewModel.getMovieCount(), 0)
        
        //When
        viewModel.fetchMovies()
        waitForExpectations(timeout: 5)
        
        //Then
        XCTAssertEqual(viewModel.getMovieCount(), 20)
    }
    
    func testGetMovieIndexZero() {
        XCTAssertNil(viewModel.getMovie(at: 0))
        
        viewModel.fetchMovies()
        waitForExpectations(timeout: 5)
        
        let itemAtZero = viewModel.getMovie(at: 0)
        XCTAssertEqual(itemAtZero?.id, 315162)
        XCTAssertEqual(itemAtZero?.title, "Puss in Boots: The Last Wish")
        XCTAssertEqual(itemAtZero?.poster, "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")

        
    }
    
    func testGetMovieIdIndexZero() {
        XCTAssertNil(viewModel.getMovieId(at: 0))
        
        viewModel.fetchMovies()
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(viewModel.getMovieId(at: 0), 315162)
    }

}

extension MovieListViewModelUnitTest: MovieViewModelDelegate {
    func moviesLoaded() {
        //Trigger
        fetchExpectation.fulfill()
    }
}
