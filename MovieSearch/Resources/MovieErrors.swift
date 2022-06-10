//
//  MovieErrors.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import Foundation

enum MovieErrors: LocalizedError {
    case badBaseURL
    case badFinalURL
    case errorInSessionSearch(Error)
    case responseNot200(HTTPURLResponse)
    case badData
    case couldNotDecode(Error)
    
    var errorDescription: String? {
        switch self {
        case .badBaseURL:
            return "The baseURL had an error"
        case .badFinalURL:
            return "The Final URL had an error"
        case .errorInSessionSearch(let error):
            return "There was an error in the Search: \(error)"
        case .responseNot200(let response):
            return "Response status code not 200: It was \(response.statusCode)"
        case .badData:
            return "Could not unwrap data"
        case .couldNotDecode(let error):
            return "The Data was unable to be decoded: \(error)"
        }
    
        
    }
}
