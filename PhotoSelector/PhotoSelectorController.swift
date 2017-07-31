//
//  PhotoSelectorController.swift
//  PhotoSelector
//
//  Created by Yue Zhou on 7/31/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoSelectorController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(PhotoSelectorCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        collectionView?.dataSource = self

        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoSelectorCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.green
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}
