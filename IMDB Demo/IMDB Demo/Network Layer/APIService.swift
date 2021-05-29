//
//  APIService.swift
//  Colombia Demo
//
//  Created by Ajharudeen Khan on 20/05/21.
//

import UIKit

class APIService :  NSObject {
    
    func apiToGetMoviesData(completion : @escaping ([Movie]?, NSException?) -> ()){
        DispatchQueue.global().async {
            var movieData : [Movie]?
            var error : NSException?
            
            defer{
                completion(movieData, error)
            }
            
            if let fileUrl = Bundle.main.url(forResource: "movies", withExtension: "json"){
                let data = try? Data.init(contentsOf: fileUrl)
                
                if let data = data {
                    
                    let jsonDecoder = JSONDecoder()
                    do {
                         movieData = try jsonDecoder.decode([Movie].self, from: data)
                    } catch let exception {
                        print(exception)
                    }
                }
            }else{
                error = NSException.init(name: .objectNotAvailableException, reason: "No file to read", userInfo: nil)
            }
        }
    }
}
