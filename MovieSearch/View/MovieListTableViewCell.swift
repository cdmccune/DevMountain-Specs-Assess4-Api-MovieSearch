//
//  MovieListTableViewCell.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    //MARK: - Properties
    
    @IBOutlet var ratingLabel: UILabel!
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

        MovieController.shared.fetchImage(movieAccessString: movie.poster) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.moviePosterImage.image = image
                case .failure(let error):
                    print(error)
                }
                self.movieTitleLabel.text = movie.title
                self.movieDescritionTextView.text = movie.movieDescription == "" ? "No Description Avaliable 😢" : movie.movieDescription
                
                self.ratingLabel.text = movie.rating == 0.0 ? "Rating Not Available 👎" : "Rating: \(movie.rating)"
                
            }
        }
    }
}
