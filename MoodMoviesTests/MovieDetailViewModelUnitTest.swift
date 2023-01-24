//
//  MovieDetailViewModelUnitTest.swift
//  MoodMoviesTests
//
//  Created by Emre Tekin on 24.01.2023.
//

import XCTest

final class MovieDetailViewModelUnitTest: XCTestCase {
    
    var viewModel: MovieDetailViewModel!
    var detailExpectation: XCTestExpectation!

    override func setUpWithError() throws {
        viewModel = MovieDetailViewModel()
        viewModel.delegate = self
        detailExpectation = expectation(description: "fetchMovieDetail")
       
    }
    
    func testGetMovieImageURL() throws {
        XCTAssertEqual(viewModel.getMovieImageURL()?.absoluteString, "https://image.tmdb.org/t/p/original")
        
        viewModel.fetchMovieDetail(id: 315162)
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(viewModel.getMovieImageURL()?.absoluteString, "https://image.tmdb.org/t/p/original/kuf6dutpsT0vSVehic3EZIqkOBt.jpg")

    }
    
    func testGetMovieTitle() {
        XCTAssertEqual(viewModel.getMovieTitle(), "")
        
        viewModel.fetchMovieDetail(id: 315162)
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(viewModel.getMovieTitle(), "Puss in Boots: The Last Wish")
        
    }
    
    func testGetMovieTagline() {
        XCTAssertEqual(viewModel.getMovieTagline(), "")
        
        viewModel.fetchMovieDetail(id: 315162)
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(viewModel.getMovieTagline(), "Say hola to his little friends.")
    }

}

extension MovieDetailViewModelUnitTest: MovieDetailViewModelDelegate {
    func movieLoaded() {
        detailExpectation.fulfill()
    }
    
    
}
