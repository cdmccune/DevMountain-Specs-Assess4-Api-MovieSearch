//
//  MovieController.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import Foundation
import CoreData

class MovieController {
    
    //MARK: - Properties
    
    static let shared = MovieController()
    var fetchedMovies: [Movie] = []
    
    
    
    //MARK: - CRD Core Data Functions
    
    
    
    
    
    //MARK: - API Call Functions
    
    func fetchMovies(movieQuery: String, completion: @escaping(Result<[Movie], MovieErrors>) -> Void) {
        
        //URL
        
        let baseURL = URLStrings.baseURL
        let version = URLStrings.version
        let searchComponent = URLStrings.searchComponent
        let movieComponent = URLStrings.movieComponent
        
        guard var url = URL(string: baseURL) else {return completion(.failure(.badBaseURL))}
        let component = version + "/" + searchComponent + "/" + movieComponent
        url.appendPathComponent(component)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let apiKeyQuery = URLQueryItem(name: URLStrings.apiKeyName, value: URLStrings.apiKeyValue)
        let adultQuery = URLQueryItem(name: URLStrings.includeAdultName, value: URLStrings.includeAdultValue)
        let languageQuery = URLQueryItem(name: URLStrings.languageName, value: URLStrings.languageValue)
        let movieNameQuery = URLQueryItem(name: URLStrings.queryName, value: movieQuery)
        let pagesQuery = URLQueryItem(name: URLStrings.pageName, value: URLStrings.pageValue)
        
        
        components?.queryItems = [apiKeyQuery,languageQuery,movieNameQuery,pagesQuery, adultQuery]
        
        guard let finalURL = components?.url else {return completion(.failure(.badFinalURL))}
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                return completion(.failure(.errorInSessionSearch(error)))
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    return completion(.failure(.responseNot200(response)))
                }
            }
            
            guard let data = data else {return completion(.failure(.badData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                return completion(.success(topLevelObject.results))
            } catch let error {
                return completion(.failure(.couldNotDecode(error)))
            }
        }.resume()
        
    }
    
    
    //I will put this function inside the custom cell.
    func fecthImages(movie: Movie) {
        
    }
    
    
}
