//
//  FavoriteMovieTableViewController.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class FavoriteMovieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.shared.favoriteMovies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Strings.favoriteCellReuseID, for: indexPath) as? FavoriteMovieTableViewCell else {return UITableViewCell()}

        let movie = MovieController.shared.favoriteMovies[indexPath.row]
        cell.favMovie = movie
        
        return cell
    }
    

    
} //End of class
