//
//  PhotoSelectorCell.swift
//  PhotoSelector
//
//  Created by Yue Zhou on 7/31/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

class PhotoSelectorCell: UICollectionViewCell {
    
    var photoSelectCellDelegate: PhotoSelectorCellDelegate?
    
    
    var image: UIImage? {
        didSet {
            if image != nil {
                addButton.setImage(image, for: UIControlState.normal)
                addButton.isUserInteractionEnabled = false
                deleteButton.isHidden = false
            }
            else {
                addButton.setImage(UIImage(named: "compose_pic_add"), for: UIControlState.normal)
                addButton.setImage(UIImage(named: "compose_pic_add_highlighted"), for: UIControlState.highlighted)
                deleteButton.isHidden = true
                addButton.isUserInteractionEnabled = true
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    /// Initializes UI and lays out subviews
    private func setupUI() {
        contentView.addSubview(addButton)
        contentView.addSubview(deleteButton)
        
        // layout
        addButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        var cons = [NSLayoutConstraint]()
        let dict = ["addButton" : addButton, "deleteButton" : deleteButton]
        cons += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[addButton]-0-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[addButton]-0-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: dict)
        
        cons += NSLayoutConstraint.constraints(withVisualFormat: "H:[deleteButton]-1-|", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: dict)
        cons += NSLayoutConstraint.constraints(withVisualFormat: "V:|-1-[deleteButton]", options: NSLayoutFormatOptions.init(rawValue: 0), metrics: nil, views: dict)
        contentView.addConstraints(cons)
    }
    
    
    // MARK: Lazy initialization
    /// the button for selecting photos
    private lazy var addButton: UIButton = {
        let btn = UIButton()
        btn.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        btn.setImage(UIImage(named: "compose_pic_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named: "compose_pic_add_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(addButtonTapped), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    /// the button for removing this photo
    private lazy var deleteButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "compose_photo_close"), for: UIControlState.normal)
        btn.isHidden = true
        btn.addTarget(self, action: #selector(deleteButtonTapped), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    
    // MARK: Listeners
    @objc private func addButtonTapped() {
        photoSelectCellDelegate?.cellDidSelect!(cell: self)
    }
    
    @objc private func deleteButtonTapped() {
        photoSelectCellDelegate?.cellDidDelete!(cell: self)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
