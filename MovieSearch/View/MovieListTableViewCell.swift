//
//  MovieListTableViewCell.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

protocol MovieListTableViewCellDelegate {
    func favoriteButtonTapped(movie: Movie, poster: UIImage?)
}

class MovieListTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var moviePosterImage: UIImageView!
    @IBOutlet var movieDescritionTextView: UITextView!
    @IBOutlet var movieTitleLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    var delegate: MovieListTableViewCellDelegate?
    
    //MARK: - Helper Functions
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        if let delegate = delegate, let movie = self.movie {
            let poster = self.moviePosterImage.image
            delegate.favoriteButtonTapped(movie: movie, poster: poster)
        }
    }
    
    func updateViews() {
        
        var isFavorite = false
        
        guard let movie = movie else {return}
        
        MovieController.shared.fetchImage(movieAccessString: movie.poster) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.moviePosterImage.image = image
                case .failure(let error):
                    print(error)
                }
                
                
                
                if MovieController.shared.favoriteMovies.contains(where: { favMovie in
                    favMovie.title == movie.title
                }) {
                    isFavorite = true
                }
                
                let image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
                self.favoriteButton.setImage(image, for: .normal)
                
                self.movieTitleLabel.text = movie.title
                self.movieDescritionTextView.text = movie.movieDescription == "" ? "No Description Avaliable 😢" : movie.movieDescription
                
                self.ratingLabel.text = movie.rating == 0.0 ? "Rating Not Available 👎" : "Rating: \(movie.rating)"
                
            }
        }
    }
}
