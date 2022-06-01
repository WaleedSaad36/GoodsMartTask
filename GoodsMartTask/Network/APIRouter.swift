//
//  APIRouter.swift
//  GoodsMartTask
//
//  Created by mohamed eltabey on 5/31/22.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible{

    //MARK:- ---- AUth ----
    case home
   
  
    
    //MARK:- HTTP Method Type
    private var method: HTTPMethod {
        switch self{
        case .home:
            return .get
        default:
            return .post
        }
    }

    static var langState = false
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .home:
            return URLs.home
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try URLs.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

    //httpMethod
        urlRequest.httpMethod = method.rawValue
        switch self {
        default:
            urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.lang)
        }
//        let token = UserDefaultsManager.shared().token
//        urlRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField: HeaderKeys.authorization)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.contentType)
        urlRequest.setValue("en", forHTTPHeaderField: HeaderKeys.lang)
        urlRequest.setValue("application/json", forHTTPHeaderField: HeaderKeys.accept)

        //HTTP Body
        let httpBody: Data? = {
            switch self {
           
            default:
                return nil
            }
        }()
        urlRequest.httpBody = httpBody

    //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .delete:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        print(try encoding.encode(urlRequest, with: parameters))
        return try encoding.encode(urlRequest, with: parameters)
        }
}

extension APIRouter {
    private func encodeToJSON<T: Encodable>(_ body: T) -> Data? {
        do {
            let anyEncodable = AnyEncodable(body)
            let jsonData = try JSONEncoder().encode(anyEncodable)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}

//type-erasing wrapper
struct AnyEncodable: Encodable {
    private let _encode: (Encoder) throws -> Void
    public init<T: Encodable>(_ wrapped: T) {
        _encode = wrapped.encode
    }
    
    func encode(to encoder: Encoder) throws {
        try _encode(encoder)
    }
}

