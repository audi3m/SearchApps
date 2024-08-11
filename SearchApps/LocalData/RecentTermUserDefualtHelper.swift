//
//  RecentTermUserDefualtHelper.swift
//  SearchApps
//
//  Created by J Oh on 8/10/24.
//

import Foundation

final class RecentTermUserDefualtHelper {
    
    static let shared = RecentTermUserDefualtHelper()
    private init() { }
    
    var recentTerms: [String] {
        get {
            return UserDefaults.standard.stringArray(forKey: "recentTerms") ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "recentTerms")
        }
    }
    
    @discardableResult
    func handleSearch(term: String) -> [String] {
        if let index = recentTerms.firstIndex(of: term) {
            recentTerms.remove(at: index)
        }
        recentTerms.append(term)
        return recentTerms
    }
    
    func deleteAll() {
        recentTerms.removeAll()
    }
    
}
