//
//  ViewController.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import AlamoFire
import MBProgressHUD
import UIKit

public class SelectFlavorViewController: UIViewController, UICollectionViewDelegate {
  
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
  
  @IBOutlet var contentView: UIView!
  @IBOutlet var collectionView: UICollectionView!
  @IBOutlet var iceCreamView: IceCreamView!
  @IBOutlet var label: UILabel!
  
  // MARK: View Lifecycle
  
  public override func viewDidLoad() {
    
    super.viewDidLoad()
    
    selectFlavorDataSource?.flavors = flavors
    selectFirstFlavor()
    
    loadFlavors()
  }
    
  private func loadFlavors() {
    
    self.showLoadingHUD()
    
    Alamofire.request(.GET, "https://raw.githubusercontent.com/JRG-Developer/CocoaPodsTutorial/master/IceCreamShop/Flavors.plist",
      parameters: nil, encoding: .PropertyList(NSPropertyListFormat.XMLFormat_v1_0, 0)).responsePropertyList { (_, response, array, error) -> Void in
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
          
          sleep(1)
          
          dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.hideLoadingHUD()
            
            if error != nil {
              println("Error: \(error!)")
              
            } else if array?.count == 0{
              println("No flavors were found!")
              
            } else if let array = array as? [[String: String]] {
              
              self.flavors = self.flavorFactory.flavorsFromDictionaryArray(array)
              self.collectionView.reloadData()
              self.selectFirstFlavor()
            }
          })
        })
    }
  }
  
  private func showLoadingHUD() {
    let hud = MBProgressHUD.showHUDAddedTo(contentView, animated: true)
    hud.labelText = "Loading..."
  }
  
  private func hideLoadingHUD() {
    MBProgressHUD.hideAllHUDsForView(contentView, animated: true)
  }
  
  private func selectFirstFlavor() {
    
    if let flavor = flavors.first {
      updateWithFlavor(flavor)
    }
  }
  
  // MARK: UICollectionViewDelegate
  
  public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    let flavor = flavors[indexPath.row]
    updateWithFlavor(flavor)
  }
  
  // MARK: Internal
  
  private func updateWithFlavor(flavor: Flavor) {
    
    iceCreamView.updateWithFlavor(flavor)
    label.text = "\(flavor.name) Ice Cream"
  }
}
