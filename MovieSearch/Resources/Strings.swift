//
//  Strings.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import Foundation

enum Strings {
    //static let
    //CoreData
    static let appName = "MovieSearch"
    
    static let cellReuseID = "movieCell"
}

enum URLStrings {
    static let baseURL = "https://api.themoviedb.org/"
    static let version = "3"
    static let searchComponent = "search"
    static let movieComponent = "movie"
    static let apiKeyName = "api_key"
    static let apiKeyValue = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    static let languageName = "language"
    static let languageValue = "en-US"
    static let queryName = "query"
    static let pageName = "page"
    static let pageValue = "1"
    static let includeAdultName = "include_adult"
    static let includeAdultValue = "false"
    static let movieBaseURL = "https://image.tmdb.org/t/p/w500"
}
