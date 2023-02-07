//
//  LoginDataModel.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/03.
//

import Foundation


struct LoginResponse: Codable {
    let data: LoginData?
    let message: String
    let result: String
}

// MARK: - DataClass
struct LoginData: Codable {
    let email: String
    let id: Int
    let jwtToken: String
    let refreshToken: String
}
