//
//  SelectFlavorDataSource.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

class SelectFlavorDataSource: NSObject, UICollectionViewDataSource {
  
  // MARK: Identifiers
  
  private struct Identifiers {
    static let ScoopCell = "ScoopCell"
    static let LoadingCell = "LoadingCell"
  }
  
  // MARK: Variables
  
  var flavors = [Flavor]()
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  
  // MARK: UICollectionViewDataSource
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return max(flavors.count, 1)
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    if flavors.count == 0 {
      return loadingCellAtIndexPath(indexPath)
      
    } else {
      return scoopCellAtIndexPath(indexPath)
    }
  }
  
  private func loadingCellAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewCell {
    
    return collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.LoadingCell, forIndexPath: indexPath) as UICollectionViewCell
  }
  
  private func scoopCellAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewCell {
   
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.ScoopCell, forIndexPath: indexPath) as ScoopCell
    configureScoopCell(cell, atIndexPath: indexPath)
    return cell
  }
  
  private func configureScoopCell(cell: ScoopCell, atIndexPath indexPath: NSIndexPath) {
    
    let flavor = flavors[indexPath.row]
    cell.updateWithFlavor(flavor)
  }
  
}
