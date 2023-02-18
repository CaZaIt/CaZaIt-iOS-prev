//
//  EmailCheckModel.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/14.
//

import Foundation

struct EmailCheckResponse: Codable {
    let code: Int
    let data: String
    let message: String
    let result: String
}
