//
//  NetworkManager.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    func request(term: String) -> Observable<SearchResponse> {
        
        let url = "https://itunes.apple.com/search?term=\(term)&country=kr&lang=ko_kr&entity=software"
        
        let result = Observable<SearchResponse>.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error != nil {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data, let appData = try? JSONDecoder().decode(SearchResponse.self, from: data) {
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    print("응답 ㅇ, 디코딩 실패")
                    observer.onError(APIError.unknownResponse)
                }
                
            }.resume()
            
            return Disposables.create()
        }
        
        return result
        
    }
}
