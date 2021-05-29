//
//  MovieListCollectionViewCell.swift
//  IMDB Demo
//
//  Created by Ajharudeen Khan on 29/05/21.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
