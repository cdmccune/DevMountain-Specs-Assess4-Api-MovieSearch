//
//  ViewController.swift
//  MovieSearch
//
//  Created by Curt McCune on 6/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieController.fetchMovies(movieQuery: "Star Wars") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    print(movies.count)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
    }
    
    
}




//                let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
//
//                guard let key = apiKey, !key.isEmpty else {
//                    print("API key does not exist")
//                    return
//                }
//                print("REST API key:", key)
