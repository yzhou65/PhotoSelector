//
//  AppDelegate.swift
//  PhotoSelector
//
//  Created by Yue Zhou on 7/31/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = PhotoSelectorController(collectionViewLayout: PhotoSelectorViewLayout())
        window?.makeKeyAndVisible()
        
        return true
    }


}


/// Customized FlowLayout
class PhotoSelectorViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        itemSize = CGSize(width: 80, height: 80)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
