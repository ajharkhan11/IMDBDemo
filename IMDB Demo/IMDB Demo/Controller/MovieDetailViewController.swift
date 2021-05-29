//
//  MovieDetailViewController.swift
//  IMDB Demo
//
//  Created by Ajharudeen Khan on 29/05/21.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    private var baseUrl = "http://image.tmdb.org/t/p/w92"

    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    var movieDetail : Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let posterPath = movieDetail?.poster_path{
            let posterUrl = baseUrl + posterPath
            posterImage.sd_setImage(with: URL.init(string: posterUrl), placeholderImage: nil, options: .retryFailed, context: nil)
        }
        
        
        rating.text = "\(movieDetail?.vote_average ?? 0.0)"
        movieTitle.text = movieDetail?.title
        movieDescription.text = movieDetail?.overview
    }
    

}
