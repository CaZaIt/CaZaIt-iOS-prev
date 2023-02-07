//
//  favoritesBottomView.swift
//  CaZaIt_FavoritesView
//
//  Created by 홍서린 on 2023/01/26.
//

import UIKit

class favoritesBottomView: UIView {
    
    
    
    //init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    
    
    
    //constraints
    func setupLayout() {
        
        backgroundColor = UIColor(r: 241, g: 241, b: 239)
        
    }
    
}
