//
//  PhotoSelectorController.swift
//  PhotoSelector
//
//  Created by Yue Zhou on 7/31/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotoSelectorController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(PhotoSelectorCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }
    
    
    // MARK: Lazy init
    fileprivate lazy var photoImages = [UIImage]()


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoImages.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoSelectorCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.green
        cell.photoSelectCellDelegate = self
        
        cell.image = (photoImages.count == indexPath.item ? nil : photoImages[indexPath.item])
        return cell
    }
}


// MARK: Delegates definition and implementation
@objc protocol PhotoSelectorCellDelegate: NSObjectProtocol {
    
    @objc optional func cellDidSelect(cell: PhotoSelectorCell)
    
    @objc optional func cellDidDelete(cell: PhotoSelectorCell)
}


extension PhotoSelectorController: PhotoSelectorCellDelegate {
    func cellDidSelect(cell: PhotoSelectorCell) {
        print(#function)
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            print("Error. Fail to access the Photo Library.")
            return
        }
        
        // Here we get the photo library that can be modally presented
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            print("Error. Fail to access the image selected.")
            return
        }
        
        let newImage = image.scaleImage(with: 300)
        
        photoImages.append(newImage)
        collectionView?.reloadData()
        
        // manually dismiss the ImagePickerController
        picker.dismiss(animated: true, completion: nil)
    }
    
    func cellDidDelete(cell: PhotoSelectorCell) {
        let indexPath = collectionView!.indexPath(for: cell)!
        photoImages.remove(at: indexPath.item)
        collectionView!.reloadData()
    }
}
