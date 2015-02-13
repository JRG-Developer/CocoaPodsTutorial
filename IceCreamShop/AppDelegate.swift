//
//  AppDelegate.swift
//  IceCreamShop
//
//  Created by Joshua Greene on 2/8/15.
//  Copyright (c) 2015 Razeware, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: Variables
  
  var window: UIWindow?

  // MARK: UIApplicationDelegate
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//    setSelectFlavorViewControllerFlavors()
    return true
  }
  
  func setSelectFlavorViewControllerFlavors() {

    let selectFlavorViewController = (window?.rootViewController as UINavigationController).topViewController as SelectFlavorViewController
    let flavorFactory = FlavorFactory()
    let flavors = flavorFactory.flavorsFromPlistNamed("Flavors")
    selectFlavorViewController.flavors = flavors!
  }
}
