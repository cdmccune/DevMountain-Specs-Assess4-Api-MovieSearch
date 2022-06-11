//
//  FavoriteMovieTableViewCell.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

protocol FavoriteMovieTableViewCellDelegate: AnyObject {
    func favoriteButtonTapped(movie: FavoriteMovie)
}

class FavoriteMovieTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var ratingLabel: UILabel!
    
    @IBOutlet var movieDescription: UITextView!
    @IBOutlet var moviePoster: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    
    var favMovie: FavoriteMovie? {
        didSet {
            updateViews()
        }
    }
    
    var delegate: FavoriteMovieTableViewCellDelegate?

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
    
    @IBAction func favoriteButtonDidClick(_ sender: Any) {
        guard let favMovie = favMovie else {return}
        guard let delegate = delegate else {return}
        
        delegate.favoriteButtonTapped(movie: favMovie)
    }
    
    

}
