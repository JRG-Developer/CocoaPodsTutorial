//
//  ViewController.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import AlamoFire
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
  
  private let flavorFactory = FlavorFactory()
  
  // MARK: Outlets
  
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {

    super.viewDidLoad()
    
    selectFlavorDataSource?.flavors = flavors
    selectFirstFlavor()
    
    loadFlavors()
  }
  
  // WARNING: Update this URL...
  
  private func loadFlavors() {
   
    Alamofire.request(.GET, "", parameters: nil, encoding: .PropertyList(NSPropertyListFormat.XMLFormat_v1_0, 0)).response { (_, _, array, error) -> Void in
      
      if let error = error {
        println("Error: \(error)")
        
      } else {
        self.flavors = self.flavorFactory.flavorsFromDictionaryArray(array as [NSDictionary])
        self.selectFirstFlavor()
      }
    }
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
