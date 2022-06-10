//
//  FavoriteMovieTableViewCell.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class FavoriteMovieTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var movieDescription: UITextView!
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    
    var favMovie: FavoriteMovie? {
        didSet {
            updateViews()
        }
    }

    //MARK: - Helper Functions
    
    func updateViews() {
        guard let favMovie = favMovie else {return}

        movieTitleLabel.text = favMovie.title
        ratingLabel.text = "Rating: \(favMovie.rating)"
        movieDescription.text = favMovie.movieDescription
        guard let data = favMovie.poster else {
            moviePoster.image = (UIImage(systemName: "photo.on.rectangle")!)
            return
        }
        moviePoster.image = UIImage (data: data)
        
    }
    

}
