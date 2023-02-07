//
//  SignupModel.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/03.
//

import Foundation


// MARK: - SignupResponse
struct SignupResponse: Codable {
    let data: SignupData?
    let message: String
    let result: String
}

// MARK: - SignupData
struct SignupData: Codable {
    let email: String
    let id: Int
    let nickname: String
    let password: String
}
