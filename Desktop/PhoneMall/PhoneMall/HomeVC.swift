//
//  HomeVC.swift
//  PhoneMall
//
//  Created by Семен Гайдамакин on 19.08.2022.
//

import Foundation
import UIKit

struct PhoneData : Codable {
    
    let homeStore : [Store]
    let bestSeller : [Seller]
    
    enum CodingKeys :  String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

struct Store : Codable {
    let id : Int
    let title : String
    let subtitle : String
    let isNew : Bool?
    let picture : String
    let isBuy : Bool
    
    enum CodingKeys : String, CodingKey {
        case isNew = "is_new"
        case isBuy = "is_buy"
        case id = "id"
        case title = "title"
        case subtitle = "subtitle"
        case picture = "picture"
    }
    
}

struct Seller : Codable {
    let id : Int
    let isFavorites : Bool
    let title : String
    let priceWithoutDiscount : Int
    let discountPrice : Int
    let picture : String
    
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case title = "title"
        case isFavorites = "is_favorites"
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture = "picture"
    }
}


class HomeVC : UICollectionViewController {
    
    var phoneData = [PhoneData]()
    
    
    
    let headerID = "HeaderID"
    static let categoryHeaderId = "CategoryHeaderID"
    
    private let cellId = "CellId"
    
    //MARK: - ViewDidLoad, надо рефакторить
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .systemGreen
        navigationItem.title = "Select category"
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId) // рег ячейку
        collectionView.register(CustomCellSection1.self, forCellWithReuseIdentifier: CustomCellSection1.identifire)
        collectionView.register(CustomCellSection2.self, forCellWithReuseIdentifier: CustomCellSection2.identifire)
        collectionView.register(CustomCellSection3.self, forCellWithReuseIdentifier: CustomCellSection3.identifire)
        collectionView.register(Header.self, forSupplementaryViewOfKind: HomeVC.categoryHeaderId, withReuseIdentifier: headerID) // рег заголовок
        performRequest(with: phoneURL)

    }
    
    init(){
        //MARK: - init comp layout
        super.init(collectionViewLayout: HomeVC.createLayout())
    }
    
    
    
    //MARK: - NETWORKING
    let phoneURL = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    //
    func performRequest(with urlString : String) {
        // 1. Create a URL
        
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            print("lol")
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    //self.delegate?.didFailWithError(error: error!)
                    print("error1")
                    return
                }
                if let safeData = data {
                    print("hehe")
                    guard let phone = try? JSONDecoder().decode(PhoneData.self, from: safeData) else {
                            fatalError("\(error!)")
                    }
                    print(phone)
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    //MARK: - Создает композишен лейаут
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, evf in
    // первый ряд
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalWidth(0.2))) //item берет размеры от group. A group уже от view
                item.contentInsets.trailing = 2
                item.contentInsets.leading = 2
                item.contentInsets.bottom = 15
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.2)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
            return section
                
            } else {
                // второй ряд
            if sectionNumber == 1 {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))) //item берет размеры от group. A group уже от view
                item.contentInsets.trailing = 2
                item.contentInsets.leading = 2
                item.contentInsets.bottom = 4
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
            return section
                
            } else {
                // третий ряд
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(4/9))) //item берет размеры от group. A group уже от view
                    item.contentInsets.trailing = 16
                    item.contentInsets.leading = 16
                    item.contentInsets.bottom = 10
                    item.contentInsets.top = 10
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                    let section = NSCollectionLayoutSection(group: group)
               
                // втыкаем заголовок для второго ряда
                section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .top)]
                    return section
                }
         }
     }
  }
    
    //MARK: - создает какой-то реюзабл вью
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        header.backgroundColor = .blue
        return header
    }
    
    //MARK: - количество секций
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //MARK: - колиечество ячеек в секции
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 6
        } else {
        if section == 1 {
            return 3
        } else {
            return 4
        }
    }
}
    //MARK: - создает ячейку
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellSection1.identifire, for: indexPath) as! CustomCellSection1
            cell.clipsToBounds = true
            cell.layer.cornerRadius = cell.frame.width/2
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellSection2.identifire, for: indexPath)
            cell.clipsToBounds = true
            cell.layer.cornerRadius = 15
            cell.backgroundColor = .brown
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellSection3.identifire, for: indexPath)
            cell.layer.cornerRadius = 15
            cell.backgroundColor = .red
            return cell
        }
    }
    
    //MARK: - чо будет по клику на ячейку
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIViewController()
        print("This cell #\(indexPath.row) located in section #\(indexPath.section)")
        vc.view.backgroundColor = indexPath.section == 0 ? .yellow : .systemGray
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}







// класс для кастомного хедера
class Header : UICollectionReusableView {
    
    private let label : UILabel = {
        let label = UILabel()
        label.text = "Best seller"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = bounds
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


