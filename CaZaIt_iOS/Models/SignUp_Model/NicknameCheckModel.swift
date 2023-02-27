//
//  NicknameCheckModel.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/27.
//

import Foundation

struct NicknameCheckResponse: Codable {
    let code: Int
    let data: String
    let message: String
    let result: String
}
