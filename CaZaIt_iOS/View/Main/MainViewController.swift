//

//  ViewController.swift

//  cazait_hsseor

//  Created by 홍서린 on 2023/01/14.

//

import UIKit

class MainViewController: UIViewController {
    
    let topview: topView = {
        let view = topView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let bottomview: bottomView = {
        let view = bottomView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    private lazy var cafeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(r: 241, g: 241, b: 239)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 34
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(customcafeView.self, forCellWithReuseIdentifier: "customcafeView")
        
        return collectionView
        
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        
        self.view.backgroundColor = UIColor(r: 93, g: 36, b: 36)
        
        setupView()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //MARK: - 네비게이션 중복 수정 1/31
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func setupView() {
        
        self.view.addSubview(topview)
        self.view.addSubview(bottomview)
        self.view.addSubview(self.cafeCollectionView)
        
        NSLayoutConstraint.activate([
            
            topview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topview.heightAnchor.constraint(equalToConstant: 95),
            topview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            topview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            bottomview.topAnchor.constraint(equalTo: self.topview.bottomAnchor, constant: 0),
            bottomview.heightAnchor.constraint(equalToConstant: 70),
            bottomview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            bottomview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            
            self.cafeCollectionView.topAnchor.constraint(equalTo: bottomview.bottomAnchor, constant: 0),
            self.cafeCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            self.cafeCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            self.cafeCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            
            
        ])
        
    }
//MARK: - 네비게이션 중복 수정 1/31
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
            }
    
}


extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customcafeView", for: indexPath) as? customcafeView
        cell?.backgroundColor = UIColor.white
        cell?.layer.cornerRadius = 30
        cell?.layer.shadowColor = UIColor.black.cgColor
        cell?.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell?.layer.shadowRadius = 4
        cell?.layer.shadowOpacity = 0.25
        return cell ?? UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 343
        let height: CGFloat = 366

        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated : true)
        self.navigationItem.title = " "
        self.navigationController?.navigationBar.tintColor = .white
    }
  
    
}
