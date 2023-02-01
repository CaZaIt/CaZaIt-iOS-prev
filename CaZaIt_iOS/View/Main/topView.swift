//
//  topView.swift
//  CaZaIt_mainview
//
//  Created by 홍서린 on 2023/01/24.
//
import UIKit

class topView: UIView {
    
    //init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    //component
    
    private let menuButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(UIImage(named:"MenuButtonx1.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
       // button.addTarget(MainViewController.self, action: #selector(menubuttonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    private let logoButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(UIImage(named:"logox1.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
        
    }()
    
    private let searchTextfield: InsetTextField = {
        
        let textField = InsetTextField();
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "search"
        textField.backgroundColor = UIColor(red: 0.898, green: 0.827, blue: 0.796, alpha: 1)
        textField.layer.cornerRadius = 20
        textField.textColor = UIColor(r: 93, g: 36, b: 36)
        textField.setPlaceholder(color: UIColor(r: 93, g: 36, b: 36))
        textField.insetX = 47.25
        textField.addleftimage(image: UIImage(named: "search"))
        textField.font = UIFont(name: "AppleSDGothicNeoM00-Regular", size: 16)
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 4)
        textField.layer.shadowRadius = 4
        textField.layer.shadowOpacity = 0.25
        
        return textField
        
    }()
    
    //constraints
    func setupLayout() {
        
        backgroundColor = .white
        
        self.addSubview(menuButton)
        self.addSubview(logoButton)
        self.addSubview(searchTextfield)
        
        NSLayoutConstraint.activate([
            
            menuButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 37),
            menuButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            menuButton.heightAnchor.constraint(equalToConstant: 37),
            
            logoButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            logoButton.widthAnchor.constraint(equalToConstant: 39),
            logoButton.heightAnchor.constraint(equalToConstant: 39),
            
            searchTextfield.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchTextfield.heightAnchor.constraint(equalToConstant: 39),
            searchTextfield.leadingAnchor.constraint(equalTo: self.logoButton.trailingAnchor, constant: 10),
            searchTextfield.trailingAnchor.constraint(equalTo: self.menuButton.leadingAnchor, constant: -10),
            
        ])
        
    }
    

    
//    @objc func menubuttonTapped(){
//
//
//    } //버튼 누르면 수행할거(나중에 네비게이션으로)
    
//    @objc func logobuttonTapped(){
//
//
//    } //버튼 누르면 수행할거(나중에 네비게이션으로)
    
    
}






