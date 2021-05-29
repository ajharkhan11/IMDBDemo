//
//  MoviesCollectionViewDataSource.swift
//  Colombia Demo
//
//  Created by Ajharudeen Khan on 29/05/21.
//

import Foundation
import UIKit

class MoviesCollectionViewDataSource<CELL : UICollectionViewCell,T> : NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    private var cellIdentifier : String!
    
    private var items : [T]!
    
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    var handleCick : ((_ movie : Movie) -> ()) = {_ in }
    
    
    private let sectionInsets = UIEdgeInsets(
      top: 10.0,
      left: 10.0,
      bottom: 10.0,
      right: 10.0)
    
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let item = self.items[indexPath.row]
        self.configureCell(cell as! CELL , item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 180, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = self.items[indexPath.row] as! Movie
        self.handleCick(item)
    }
}
