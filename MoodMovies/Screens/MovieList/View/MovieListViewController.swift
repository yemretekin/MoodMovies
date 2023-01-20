//
//  MovieListViewController.swift
//  MoodMovies
//
//  Created by Emre Tekin on 12.01.2023.
//

import UIKit

class MovieListViewController: UIViewController {
    @IBOutlet weak var movieListTableView: UITableView!
    
    private var viewModel: MovieViewModelProtocol = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchMovies()
        configure()
        
        
    }
    
    private func configure(){
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
    }
}

extension MovieListViewController: MovieViewModelDelegate {
    func moviesLoaded() {
        movieListTableView.reloadData()
    }
}

extension MovieListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMovieCount()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieListTableViewCell, let model = viewModel.getMovie(at: indexPath.row) else { return UITableViewCell() }
        cell.configureCell(movie: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
        detailVC.movieId = viewModel.getMovieId(at: indexPath.row)
        present(detailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
