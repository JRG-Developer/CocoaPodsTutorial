//
//  ViewController.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

class SelectFlavorViewController: UIViewController, UICollectionViewDelegate {
  
  // MARK: Variables
  
  var flavors: [Flavor] = [] {
    didSet {
     selectFlavorDataSource?.flavors = flavors
    }
  }
  
  private var selectFlavorDataSource: SelectFlavorDataSource? {
    return collectionView?.dataSource as SelectFlavorDataSource?
  }
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {

    super.viewDidLoad()
  
    selectFlavorDataSource?.flavors = flavors
    selectFirstFlavor()
  }
  
  private func selectFirstFlavor() {

    if let flavor = flavors.first {
      updateWithFlavor(flavor)
    }
  }
  
  // MARK: UICollectionViewDelegate
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {    
        
    let flavor = flavors[indexPath.row]
    updateWithFlavor(flavor)
  }
  
  // MARK: Internal
  
  private func updateWithFlavor(flavor: Flavor) {

    iceCreamView.updateWithFlavor(flavor)
    label.text = "\(flavor.name) Ice Cream"
  }
}
