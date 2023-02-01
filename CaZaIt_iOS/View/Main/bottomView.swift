//
//  bottomView.swift
//  CaZaIt_mainview
//
//  Created by 홍서린 on 2023/01/24.
//
import UIKit

class bottomView: UIView {
    
    

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
   
    private let filterButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(UIImage(named:"filterButtonx1.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
   //     button.addTarget(MainViewController.self, action: #selector(filterbuttonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    
    private let filterLabel: UILabel = {
        
        let Label = UILabel()
        
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.text = "거리순"
        Label.textColor = UIColor(r: 93, g: 36, b: 36)
        Label.font = UIFont(name: "AppleSDGothicNeoB00-Regular", size: 17)
        Label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        return Label
        
    }()
    
    
        
    //constraints
    func setupLayout() {
        
        backgroundColor = UIColor(r: 241, g: 241, b: 239)
        
        self.addSubview(filterButton)
        self.addSubview(filterLabel)
        
        NSLayoutConstraint.activate([
            filterButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            filterButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            filterButton.widthAnchor.constraint(equalToConstant: 37),
            filterButton.heightAnchor.constraint(equalToConstant: 37),
            

            
            filterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: filterButton.trailingAnchor, constant: 10),
            filterLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100),
            filterLabel.heightAnchor.constraint(equalToConstant: 20)
        
        
        ])
        
        
        
    }
        
    private let borderLayer = CAShapeLayer()
        
        override func draw(_ rect: CGRect) {
            
            borderLayer.strokeColor = UIColor(red: 0.363, green: 0.142, blue: 0.142, alpha: 1).cgColor
            borderLayer.backgroundColor = UIColor.clear.cgColor
            borderLayer.fillColor = UIColor.clear.cgColor
            //점선의 두께
            borderLayer.lineWidth = 2
            layer.addSublayer(borderLayer)
            
            let path = CGMutablePath()
            //좌상단 (0 , 0) 우하단 (max,max)
            //점선 시작지점 설정
            var x : CGFloat = 7
            while x <= rect.maxX - 7 {
                //라인을 그릴 시작 지점을 (x, 0)으로 옮기는 과정
                path.move(to: CGPoint(x: x, y: 0))
                x += 7
                // (x,0) 에서 (x + 10,0) 까지 선을 그어줌
                path.addLine(to: CGPoint(x: x, y: 0))
                x += 7
            }
            //UIBezierPath(roundedRect)은 말그대로 frame을 둘러서 그리느라 사각형으로 그려짐.
            //따라서 선 하나 그어주는것은 cgPath로 그려주기
            borderLayer.path = UIBezierPath(cgPath: path).cgPath
        }
    
    
//    @objc func filterbuttonTapped(){
//
//        
//    } //버튼 누르면 수행할거(나중에 네비게이션으로)
//
}



