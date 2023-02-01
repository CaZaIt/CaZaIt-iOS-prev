//
//  LogInVC.swift
//  cazait_seok
//
//  Created by 강석호 on 2023/01/09.
//

import Foundation

import UIKit

final class LoginViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cazait_logo2")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let idtextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        textField.isSecureTextEntry = false
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(r: 125, g: 91, b: 81).cgColor
        textField.layer.borderWidth = 1
        textField.setPlaceholder(color: UIColor(r: 93, g: 36, b: 36))
        return textField
    }()
    
    private let passwordtextField: InsetTextField = {
        let textField = InsetTextField()
        textField.insetX = 16
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(r: 125, g: 91, b: 81).cgColor
        textField.layer.borderWidth = 1
        textField.setPlaceholder(color: UIColor(r: 93, g: 36, b: 36))
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.554, green: 0.376, blue: 0.376, alpha: 1)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor(w: 41), for: .normal)
        return button
    }()
    
    private let contrainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.view.addSubview(self.contrainer)
        
        
        
        self.contrainer.addArrangedSubview(self.titleImageView)
        self.contrainer.addArrangedSubview(self.idtextField)
        self.contrainer.addArrangedSubview(self.passwordtextField)
        self.contrainer.addArrangedSubview(self.loginButton)
        self.contrainer.addArrangedSubview(self.signupButton)

        
        
        self.contrainer.setCustomSpacing(62, after: titleImageView)
        self.contrainer.setCustomSpacing(30, after: passwordtextField)
        self.contrainer.setCustomSpacing(30, after: loginButton)
        
        NSLayoutConstraint.activate([
            self.contrainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.contrainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.contrainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            
            self.idtextField.leadingAnchor.constraint(equalTo: self.contrainer.leadingAnchor),
            self.idtextField.leadingAnchor.constraint(equalTo: self.contrainer.trailingAnchor),
            self.idtextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordtextField.leadingAnchor.constraint(equalTo: self.contrainer.leadingAnchor),
            self.passwordtextField.leadingAnchor.constraint(equalTo: self.contrainer.trailingAnchor),
            self.passwordtextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.loginButton.leadingAnchor.constraint(equalTo: self.contrainer.leadingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.contrainer.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            self.signupButton.leadingAnchor.constraint(equalTo: self.contrainer.leadingAnchor),
            self.signupButton.leadingAnchor.constraint(equalTo: self.contrainer.trailingAnchor),
            self.signupButton.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        // 로그인하기 버튼 클릭시 다음화면으로 이동
        self.loginButton.addTarget(self, action: #selector(onPressLoginButton), for: .touchUpInside)
        // 회원가입 버튼 클릭시 다음화면으로 이동
        self.signupButton.addTarget(self, action: #selector(onPressSignupButton), for: .touchUpInside)
        
    }
    
    @objc func onPressLoginButton(sender: Any) {
        let nav = UINavigationController()
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.tintColor = UIColor(w: 42)
        
       //MARK: - 네비게이션 중복 수정 1/31
        nav.navigationBar.isHidden = true
        
        let controller = TabBarViewController()
        nav.viewControllers = [controller]
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc private func onPressSignupButton(sender: Any) {
        let nav = UINavigationController()
        nav.modalPresentationStyle = .fullScreen
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.tintColor = UIColor(w: 42)
        
        let controller = SignUpViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        
    
        
    }
    
    
    
    //네비게이션 탭바 없애기
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                self.view.endEditing(true)
            }
}
