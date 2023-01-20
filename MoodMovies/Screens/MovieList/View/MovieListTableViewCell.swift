//
//  MovieListTableViewCell.swift
//  MoodMovies
//
//  Created by Emre Tekin on 20.01.2023.
//

import UIKit
import AlamofireImage

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    
    func configureCell(movie: MovieModel){
        movieTitle.text = movie.title
        guard let url = URL(string: MovieDBClient.IMAGE_BASE_URL + movie
            .poster) else { return }
        movieImage.af.setImage(withURL: url)
    }
    override func prepareForReuse() {
        movieImage.image = nil
    }

}
