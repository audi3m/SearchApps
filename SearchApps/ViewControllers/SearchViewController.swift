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
    let tableView = UITableView()
    
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
        
        view.addSubview(tableView)
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    
}

// TableView
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.id, for: indexPath) as! ResultTableViewCell
        
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewControllers()
        navigationController?.pushViewController(vc, animated: true)
    }
}
