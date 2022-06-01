//
//  APIManager.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Alamofire

class APIManager {
    //MARK:- Authantication

    static func HomeArticle(completion:@escaping (Result<HomeResponse, Error>)->()){
        request(APIRouter.home) { (result) in
            completion(result)
        }
    }
    
    
}

extension APIManager{
    // MARK:- The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseString { response in
            print(response)
        }
        .responseJSON { response in
            switch response.result {
            
            case .failure(let error):
                completion(.failure(error))
            default:
                return
            }
            print(response)
        }
    }
    
}
