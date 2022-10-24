//
//  ProductDetailsCustomCell.swift
//  PhoneMall
//
//  Created by Семен Гайдамакин on 15.09.2022.
//

import UIKit

class ProductDetailsCustomCell: UICollectionViewCell {
    
    static let identife = "identifire"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    lazy var imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "homeStoreSamsungNote")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = bounds
        return image
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
