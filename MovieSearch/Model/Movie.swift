//
//  Movie.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import Foundation

struct TopLevelObject {
    var results: [Movie]
    
    struct Movie {
        var poster: String
        var title: String
        var rating: Double
        var movieDescription: String
    }
}
