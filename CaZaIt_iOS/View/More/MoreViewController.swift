//
//  MoreViewController.swift
//  cazait_seok
//
//  Created by 강석호 on 2023/01/14.
//


import Foundation
import SnapKit
import UIKit



final class MoreViewController: UIViewController {
    
    let table = UITableView()
    let testArr = ["공지사항", "앱 설정","고객센터","약관 및 정책"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        table.delegate = self
        table.dataSource = self
        
        attribute()
        layout()
    }
    
    func layout() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    func attribute() {
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}



extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
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
        cell.textLabel?.textColor = .black
        cell.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        tableView.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        
        return cell
    }
    
    
}
