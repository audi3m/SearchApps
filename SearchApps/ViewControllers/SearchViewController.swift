//
//  SearchViewController.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: SearchResultsViewController())
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        NetworkManager.shared.request(term: "travel")
            .subscribe(with: self) { owner, response in
                
            }
            .disposed(by: disposeBag)
        
        
    }
}

extension SearchViewController {
    
    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.searchController = searchController
        
    }
    
    
}


