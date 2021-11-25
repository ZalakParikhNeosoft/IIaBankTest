//
//  ImageCollectionCell.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    
    //MARK: - IBOutlets -
    @IBOutlet private weak var imageView  : UIImageView!
    
    var bgImage: UIImage?  {
        didSet {
            imageView.image = bgImage
        }
    }
}

