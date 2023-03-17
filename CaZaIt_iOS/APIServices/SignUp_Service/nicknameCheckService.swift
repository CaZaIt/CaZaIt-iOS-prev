//
//  nicknameCheckService.swift
//  CaZaIt_iOS
//
//  Created by 강석호 on 2023/02/27.
//

import Foundation

import Alamofire


class nicknameCheckService {
    
    static let shared = nicknameCheckService()

    private init() {}
    
    func nicknamecheck(nickname: String, completion: @escaping(NetworkResult<Any>) -> Void)
    {
        //https://cazait.shop/api/users/email?email=rkdntlzl@naver.com
        let url = "\(APIConstants.nicknamecheckURL)?nickName=\(nickname)" //통신할 API 주소
        
        

        let dataRequest = AF.request(url,
                                    method: .get,
                                    encoding: JSONEncoding.default)
                                    
        //request 시작 ,responseData를 호출하면서 데이터 통신 시작
        dataRequest.responseData{
            response in //데이터 통신의 결과가 response에 담기게 된다
            switch response.result {
            case .success: //데이터 통신이 성공한 경우에
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300 : return isVaildData(data: data)
        case 400..<500 : return .pathErr
        case 500..<600 : return .serverErr
        default : return .networkFail
        }
    }
    //통신이 성공하고 원하는 데이터가 올바르게 들어왔을때 처리하는 함수
    private func isVaildData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder() //서버에서 준 데이터를 Codable을 채택
        guard let decodedData = try? decoder.decode(NicknameCheckResponse.self, from: data)
        //데이터가 변환이 되게끔 Response 모델 구조체로 데이터를 변환해서 넣고, 그 데이터를 NetworkResult Success 파라미터로 전달
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}
