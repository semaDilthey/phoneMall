//
//  CustomCellSection3.swift
//  PhoneMall
//
//  Created by Семен Гайдамакин on 25.08.2022.
//

import UIKit

class CustomCellSection3: UICollectionViewCell {
    
    static let identifire = "CustomCellSection3"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        contentView.addSubview(isFavoritesButton)
        contentView.addSubview(priceLabel)
        contentView.addSubview(discountPriceLabel)
        contentView.addSubview(nameLabel)


    }
    
    private let image : UIImageView = {
        let image = UIImageView()
        //image.image = UIImage(named: "pp1")
        image.image = UIImage(systemName: "house")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // значения для кнопки надо сохранять в юзерДефолтс
    private let isFavoritesButton : UIButton = {
        let butt = UIButton()
        butt.backgroundColor = .white
        butt.setImage(UIImage(systemName: "house"), for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        return butt
    }()
    
    private let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "1500$"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountPriceLabel : UILabel = {
        let label = UILabel()
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$1111")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        label.attributedText = attributeString
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Phone name lalalalal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstaints()
    }
    
    
    func setupConstaints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            isFavoritesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            isFavoritesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            isFavoritesButton.widthAnchor.constraint(equalToConstant: 30),
            isFavoritesButton.heightAnchor.constraint(equalToConstant: 30),
            
            priceLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            priceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width/3),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            discountPriceLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: -5),
            discountPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 3),
            discountPriceLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width/3),
            discountPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)



        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
