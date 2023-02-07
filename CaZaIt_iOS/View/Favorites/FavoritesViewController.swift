//
//  ViewController.swift
//  CaZaIt_FavoritesView
//
//  Created by 홍서린 on 2023/01/26.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let topview: favoritesTopView = {
        let view = favoritesTopView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let bottomview: favoritesBottomView = {
        let view = favoritesBottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
   
    private lazy var cafeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(r: 241, g: 241, b: 239)
        layout.minimumLineSpacing = 25
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(favoritesCustomCafeView.self, forCellWithReuseIdentifier: "favoritesCustomCafeView")
        

        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(r: 93, g: 36, b: 36)
        
        setupView()
    
        
    }
    
    func setupView() {
        
        self.view.addSubview(topview)
        self.view.addSubview(bottomview)
        self.bottomview.addSubview(self.cafeCollectionView)
        
        NSLayoutConstraint.activate([
            
            self.cafeCollectionView.topAnchor.constraint(equalTo: self.bottomview.topAnchor, constant: 13),
            self.cafeCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17),
            self.cafeCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            self.cafeCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            topview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 54),
            topview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -720),
            topview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            topview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            bottomview.topAnchor.constraint(equalTo: self.topview.bottomAnchor, constant: 0),
            bottomview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            bottomview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            bottomview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            
        ])
        
    }
    
}

extension FavoritesViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoritesCustomCafeView", for: indexPath) as? favoritesCustomCafeView
        cell?.backgroundColor = UIColor.white
        cell?.layer.cornerRadius = 15
        cell?.layer.shadowColor = UIColor.black.cgColor
        cell?.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell?.layer.shadowRadius = 4
        cell?.layer.shadowOpacity = 0.25


        return cell ?? UICollectionViewCell()
    }
}



extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = (UIScreen.main.bounds.width - 49) / 2
        let cellHeight = cellWidth * ( 267 / 172 )

        return CGSize(width: cellWidth, height: cellHeight)
    }


}
