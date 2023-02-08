//
//  MyPageViewController.swift
//  cazait_seok
//
//  Created by 강석호 on 2023/01/14.
//

import Foundation
import UIKit

//hi

//struct User {
//    let profile = UIImage()
//    let name = String
//}



final class MyPageViewController: UIViewController {
    
    let table = UITableView()
    let testArr = ["결제 내역", "최근 본 매장","쿠폰"]
    
    private let Label_1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(r: 93, g: 36, b: 36)
        label.textAlignment = .center
        label.text = "로그인 하세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let Button_1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "right_arrow"), for: .normal)
        button.clipsToBounds = true
        return button
    }()

    private let payView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(r: 229, g: 211, b: 203)
        view.distribution = .fill
        view.spacing = 1
        view.axis = .vertical
        view.alignment = .center
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    private let Label_2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(r: 93, g: 36, b: 36)
        label.textAlignment = .left
        label.text = "카자잇 페이"
        label.numberOfLines = 1
        return label
    }()
    
    private let Label_3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor(r: 93, g: 36, b: 36)
        label.textAlignment = .right
        label.text = "1111 ￦"
        label.numberOfLines = 1
        return label
    }()
    
    private let Label_4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .right
        label.text = " "
        label.numberOfLines = 1
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        self.view.addSubview(self.Label_1)
        self.view.addSubview(self.Button_1)
        
        self.view.addSubview(self.payView)
        
        self.payView.addArrangedSubview(Label_2)
        self.payView.addArrangedSubview(Label_3)
        self.payView.addArrangedSubview(Label_4)
        
        self.payView.setCustomSpacing(10, after: Label_2)
        
        table.delegate = self
        table.dataSource = self
        
        attribute()
        layout()
        
        
        NSLayoutConstraint.activate([
            self.Label_1.heightAnchor.constraint(equalToConstant: 30),
            self.Label_1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.Label_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            
            self.Button_1.heightAnchor.constraint(equalToConstant: 30),
            self.Button_1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 160),
            self.Button_1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            
            self.payView.heightAnchor.constraint(equalToConstant: 150),
            self.payView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.payView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.payView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 190),
            
            self.Label_2.leadingAnchor.constraint(equalTo: self.payView.leadingAnchor, constant: 13),
            self.Label_2.topAnchor.constraint(equalTo: self.payView.topAnchor),
            
            self.Label_3.leadingAnchor.constraint(equalTo: self.payView.leadingAnchor),
            self.Label_3.trailingAnchor.constraint(equalTo: self.payView.trailingAnchor,constant: -30),
            
            self.Label_4.leadingAnchor.constraint(equalTo: self.payView.leadingAnchor, constant: 270),
            self.Label_4.trailingAnchor.constraint(equalTo: self.payView.trailingAnchor),
            

            ])
        
        
    }
    func layout() {
        view.addSubview(table)
        table.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.topAnchor, constant: 360).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    func attribute() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as UITableViewCell
        
        lazy var imgView: UIImageView = {
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.image = UIImage(systemName: "sun.max")
            return view
        }()
        
        cell.contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(21.87)
            make.height.equalTo(27.33)
            make.left.equalToSuperview().inset(36.47)
        }
        
        cell.textLabel?.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imgView.snp.right).offset(24.67)
        }
        
        cell.textLabel?.text = testArr[indexPath.row]
        cell.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        cell.textLabel?.textColor = .black
        
        return cell
    }
    
    
}
