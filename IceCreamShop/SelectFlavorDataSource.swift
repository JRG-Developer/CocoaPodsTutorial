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
    static let FlavorCell = "FlavorCell"
  }
  
  // MARK: Variables
  
  var flavors = [Flavor]()
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  
  // MARK: UICollectionViewDataSource
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return flavors.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Identifiers.FlavorCell, forIndexPath: indexPath) as FlavorCell
    configureFlavorCell(cell, atIndexPath: indexPath)
    return cell
  }
  
  func configureFlavorCell(cell: FlavorCell, atIndexPath indexPath: NSIndexPath) {    
    
    let flavor = flavors[indexPath.row]
    cell.updateWithFlavor(flavor)
  }
}
