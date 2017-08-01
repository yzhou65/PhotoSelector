//
//  UIImage+ScaleExtension.swift
//  PhotoSelector
//
//  Created by Yue Zhou on 7/31/17.
//  Copyright © 2017 Yue Zhou. All rights reserved.
//

import UIKit

extension UIImage {
    
    func scaleImage(with newWidth: CGFloat) -> UIImage {
        
        // Based on the original width/height ratio and a new width as the argument, compute the new size
        let newSize = CGSize(width: newWidth, height: size.height * newWidth / size.width)
        
        // Begin graphics context and draw a new scaled image based on the computed newSize
        UIGraphicsBeginImageContext(newSize)
        
        draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // close the context
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
