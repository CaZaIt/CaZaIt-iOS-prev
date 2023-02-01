//
//  favoritesCustomCafeView.swift
//  CaZaIt_FavoritesView
//
//  Created by 홍서린 on 2023/01/26.
//

import UIKit
//롬곡
class favoritesCustomCafeView: UICollectionViewCell {
    
    let cafeImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "firstpcx1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return imageView
    }()
    
    let cafeName: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "롬곡"
        label.numberOfLines = 1
        
        return label
    }()
    
    let cafeLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "서울특별시 광진구 광나루로 375-1 2층(군자동)"
        label.numberOfLines = 0
        
        return label
    }()
    
    let cafeConfusion: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(r: 83, g: 51, b: 41)
        label.textAlignment = .center
        label.text = "보통"
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.layer.borderWidth = 0.5
        label.backgroundColor = UIColor(r: 229, g: 211, b: 203)
        label.layer.borderColor = UIColor(red: 0.898, green: 0.827, blue: 0.796, alpha: 1).cgColor
        label.numberOfLines = 1
        
        
        return label
    }()
    
    let favoriteImage: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x:0, y:0, width: 16, height: 15)
        button.clipsToBounds = true
        button.setImage(UIImage(named:"favoritex1.png"), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        
        backgroundColor = .white
        self.addSubview(cafeImage)
        self.addSubview(cafeName)
        self.addSubview(cafeLocation)
        self.addSubview(cafeConfusion)
        self.addSubview(favoriteImage)
        
        NSLayoutConstraint.activate([
            
            //롬곡 제약조건
            cafeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cafeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cafeImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cafeImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.55),
            
            cafeName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cafeName.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -122),
            cafeName.topAnchor.constraint(equalTo: cafeImage.bottomAnchor, constant: 10),
            cafeName.heightAnchor.constraint(equalToConstant: 29),
            
            cafeLocation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cafeLocation.topAnchor.constraint(equalTo: cafeName.bottomAnchor, constant: 5),
            cafeLocation.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            
            cafeConfusion.topAnchor.constraint(equalTo: cafeLocation.bottomAnchor, constant: 15),
            cafeConfusion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            cafeConfusion.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cafeConfusion.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            favoriteImage.leadingAnchor.constraint(equalTo: cafeName.trailingAnchor, constant: 93.67),
            favoriteImage.topAnchor.constraint(equalTo: cafeImage.bottomAnchor, constant: 12),
            
            
        ])
    }
}

