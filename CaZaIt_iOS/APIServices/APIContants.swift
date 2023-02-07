//
//  APIContants.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/03.
//

import Foundation

struct APIConstants {
    // MARK: -  Base URL
    static let baseURL = "https://cazait.shop"
    
    // MARK: - Feature URL
    static let loginURL = baseURL + "/api/users/log-in"
    
    static let signupURL = baseURL + "/api/users/sign-up"
    
    static let cafeinfoURL = baseURL + "/api/menu/cafe/1"
    
}
