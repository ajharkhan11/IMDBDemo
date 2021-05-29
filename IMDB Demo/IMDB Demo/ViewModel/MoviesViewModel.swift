//
//  MoviesViewModel.swift
//  IMDB Demo
//
//  Created by Ajharudeen Khan on 29/05/21.
//

import Foundation

class MoviesViewModel: NSObject {
    
    private var apiService : APIService!
    var bindMovieViewModelToController : (() -> ()) = {}
    
    private(set) var movies : [Movie]!{
        didSet{
            self.bindMovieViewModelToController()
        }
    }
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetMoviesData()
    }
    
    func callFuncToGetMoviesData()  {
        self.apiService.apiToGetMoviesData(completion: { (movies, exception) in
            if(movies != nil){
                self.movies = movies
            }
        })
    }
}
