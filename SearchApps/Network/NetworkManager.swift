//
//  NetworkManager.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import Foundation
import RxSwift

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    func request(term: String, hander: @escaping (SearchResponse) -> Void) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(term)&limit=39&country=kr&lang=ko_kr&entity=software") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else { return }
            
            if let data, let appData = try? JSONDecoder().decode(SearchResponse.self, from: data) {
                dump(appData)
                DispatchQueue.main.async {
                    hander(appData)
                }
            } else {
                print("응답 ok, 디코딩 실패")
            }
            
        }.resume()
        
        
    }
}
