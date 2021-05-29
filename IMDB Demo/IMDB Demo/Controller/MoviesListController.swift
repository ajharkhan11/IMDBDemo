//
//  ViewController.swift
//  IMDB Demo
//
//  Created by Ajharudeen Khan on 29/05/21.
//

import UIKit
import SDWebImage

class MoviesListController: UIViewController {
    
    private var movieViewModel : MoviesViewModel!
    
    private var reusableIdentifier = "movie_collection_cell"
    
    private var dataSource : MoviesCollectionViewDataSource<MovieListCollectionViewCell , Movie>!
    
    private var baseUrl = "http://image.tmdb.org/t/p/w92"
    
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callToViewModelForUIUpdate()
        moviesCollectionView.register(UINib.init(nibName: "MovieListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reusableIdentifier)
        
    }

    func callToViewModelForUIUpdate() {
        self.movieViewModel = MoviesViewModel()
        self.movieViewModel.bindMovieViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource()  {
        self.dataSource = MoviesCollectionViewDataSource.init(cellIdentifier: reusableIdentifier, items: self.movieViewModel.movies, configureCell: { [unowned self] (cell, movie) in
            cell.title?.text = movie.title
            cell.rating?.text = "\(movie.vote_average ?? 0.0)"
            
            if let posterPath = movie.poster_path{
                let posterUrl = baseUrl + posterPath
                cell.posterImage.sd_setImage(with: URL.init(string: posterUrl), placeholderImage: nil, options: .retryFailed, context: nil)
            }
        })
        
        DispatchQueue.main.async {
            self.moviesCollectionView.dataSource = self.dataSource
            self.moviesCollectionView.delegate = self.dataSource
            self.moviesCollectionView.reloadData()
        }
        self.dataSource.handleCick = { (item) in
            self.performSegue(withIdentifier: "detail_screen", sender: item)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let movie = sender {
            let detailController = segue.destination as? MovieDetailViewController
            detailController?.movieDetail = movie as? Movie
        }
    }
    
}

