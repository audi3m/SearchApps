//
//  SearchHomeViewController.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class SearchHomeViewController: UIViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
//    private let recentLabel: UILabel = {
//        let label = UILabel()
//        label.text = "최근검색"
//        label.font = .boldSystemFont(ofSize: 15)
//        return label
//    }()
//    lazy private  var deleteAllButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("전체삭제", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
//        button.addTarget(self, action: #selector(deleteAllRecent), for: .touchUpInside)
//        return button
//    }()
    lazy private var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.id)
        view.separatorStyle = .none
        return view
    }()
    
    let disposeBag = DisposeBag()
    let viewModel = SearchViewModel()
    
    var list = [Appp]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        
    }
}

// Search
extension SearchHomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let term = searchBar.text else { return }
        NetworkManager.shared.request(term: term) { [weak self] apps in
            self?.list = apps.results
            self?.tableView.reloadData()
        }
    }
    
    
    
}

// tableView
extension SearchHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResultTableViewCell.id, for: indexPath) as! ResultTableViewCell
        let appp = list[indexPath.row]
        cell.appp = appp
        cell.configureData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewControllers()
        let appp = list[indexPath.row]
        vc.appp = appp
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

// configure
extension SearchHomeViewController {
    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "검색"
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
//        view.addSubview(recentLabel)
//        view.addSubview(deleteAllButton)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
//        recentLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view).offset(20)
//            make.height.equalTo(30)
//        }
//        
//        deleteAllButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view).offset(-20)
//            make.height.equalTo(30)
//        }
//        
//        tableView.snp.makeConstraints { make in
//            make.top.equalTo(recentLabel.snp.bottom)
//            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
    }
}

