//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    
    //MARK: - Properites
    @IBOutlet var searchBar: UISearchBar!
    
    
    //MARK: - Lifecycle Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.shared.fetchFavoriteMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    //MARK: - Helper Functions
    
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.shared.fetchedMovies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.searchCellReuseID, for: indexPath) as? MovieListTableViewCell else {return UITableViewCell()}
        
        cell.movie = MovieController.shared.fetchedMovies[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    
} //End of class

extension MovieListTableViewController: MovieListTableViewCellDelegate {
    func favoriteButtonTapped(movie: Movie, poster: UIImage?) {
        
        if let movie = MovieController.shared.favoriteMovies.first(where: { favMovie in
            favMovie.title == movie.title
        }) {
            MovieController.shared.deleteFavoriteMovie(movie: movie)
        } else {
            MovieController.shared.createFavoriteMovie(movie: movie, poster: poster)
        }
        tableView.reloadData()
    }
    
    
    
    
}

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let movieName = searchBar.text, movieName != "" {
            MovieController.shared.fetchMovies(movieQuery: movieName) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        MovieController.shared.fetchedMovies = movies
                        self.searchBar.text = ""
                        self.tableView.reloadData()
                        self.searchBar.resignFirstResponder()
                    case .failure(let error):
                        print(error)
                        self.searchBar.resignFirstResponder()
                    }
                }
            }
        }
    }
}
