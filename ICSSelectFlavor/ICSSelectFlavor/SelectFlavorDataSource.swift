//
//  SelectFlavorDataSource.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

public class SelectFlavorDataSource: NSObject, UICollectionViewDataSource {
  
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
  
  public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }
  
  public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    return scoopCellAtIndexPath(indexPath)
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
