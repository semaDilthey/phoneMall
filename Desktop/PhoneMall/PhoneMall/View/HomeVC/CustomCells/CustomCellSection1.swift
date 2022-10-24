//
//  CustomCellSection1.swift
//  PhoneMall
//
//  Created by Семен Гайдамакин on 25.08.2022.
//

import UIKit

class CustomCellSection1: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(view)
        contentView.addSubview(image)
        contentView.addSubview(label)
    }
    
    
    static let identifire = "CustomCellSection1"
    
    private let view : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        
        return view
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phones"
        return label
    }()
    
    private let image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    //MARK: - Расстановка лэйаута для наших сабВьюх
    override func layoutSubviews() {
        super.layoutSubviews()
        
        view.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height-contentView.frame.height/4)
        view.layer.cornerRadius = view.frame.height/2
        
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        label.frame = CGRect(x: 0, y: contentView.frame.height-10 , width: contentView.frame.width, height: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
