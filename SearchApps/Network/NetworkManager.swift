//
//  NetworkManager.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import Foundation
import RxSwift
import Alamofire

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case decodingError
    case statusError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    func requestSingle(term: String) -> Single<SearchResponse> {
        return Single.create { observer -> Disposable in
            let url = API.url + "&term=\(term)"
            
            AF.request(url)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: SearchResponse.self) { response in
                    switch response.result {
                    case .success(let success):
                        observer(.success(success))
                    case .failure(let error):
                        observer(.failure(error))
                    }
                }
            
            return Disposables.create()
        }
        .debug("Single Request")
    }
    
    func request(term: String) -> Observable<SearchResponse> {
        
        let result = Observable<SearchResponse>.create { observer in
            guard let url = URL(string: API.url + "&term=\(term)") else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else { return }
                
                if let data, let appData = try? JSONDecoder().decode(SearchResponse.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    print("응답 ok, 디코딩 실패")
                    observer.onError(APIError.decodingError)
                }
            }.resume()
            
            return Disposables.create()
            
        }
        
        return result
    }
}
