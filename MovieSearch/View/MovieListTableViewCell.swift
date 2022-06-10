//
//  MovieListTableViewCell.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet var moviePosterImage: UIImageView!
    @IBOutlet var movieDescritionTextView: UITextView!
    @IBOutlet var movieTitleLabel: UILabel!
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helper Functions
    
    func updateViews() {
        guard let movie = movie else {return}

        movieTitleLabel.text = movie.title
    }

}
