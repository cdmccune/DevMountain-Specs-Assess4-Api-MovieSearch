//
//  FavoriteMovie+Convenience.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import CoreData

extension FavoriteMovie {
    @discardableResult convenience init (context: NSManagedObjectContext = CoreDataStack.context, movieDescription: String, rating: Double, title: String, poster: Data?) {
        self.init(context: context)
        self.title = title
        self.rating = rating
        self.poster = poster
        self.movieDescription = movieDescription
        self.id = UUID().uuidString
    }
}
