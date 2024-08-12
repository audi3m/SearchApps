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
    private let tableView: UITableView = {
        let view = UITableView()
        view.register(ResultTableViewCell.self, forCellReuseIdentifier: ResultTableViewCell.id)
        view.separatorStyle = .none
        return view
    }()
    
    let disposeBag = DisposeBag()
    let viewModel = SearchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        rxBind()
    }
}

// Rx
extension SearchHomeViewController: UISearchBarDelegate {
    private func rxBind() {
        let input = SearchViewModel.Input(searchText: searchController.searchBar.rx.text.orEmpty,
                                          searchButtonTap: searchController.searchBar.rx.searchButtonClicked)
        let output = viewModel.transform(input: input)
        
        output.apppList
            .bind(to: tableView.rx.items(cellIdentifier: ResultTableViewCell.id, cellType: ResultTableViewCell.self)) { row, appp, cell in
                cell.appp = appp
                cell.configureData()
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Appp.self)
            .subscribe(with: self, onNext: { owner, appp in
                let vc = DetailViewControllers()
                vc.appp = appp
                owner.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
         
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
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

