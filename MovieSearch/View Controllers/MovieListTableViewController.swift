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
        
       
        
        
    }
    
    
    
    //MARK: - Helper Functions
    
    
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.shared.fetchedMovies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.cellReuseID, for: indexPath) as? MovieListTableViewCell else {return UITableViewCell()}
        
        cell.movie = MovieController.shared.fetchedMovies[indexPath.row]
        
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    
} //End of class

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let movieName = searchBar.text, movieName != "" {
            MovieController.shared.fetchMovies(movieQuery: movieName) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        MovieController.shared.fetchedMovies = movies
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
