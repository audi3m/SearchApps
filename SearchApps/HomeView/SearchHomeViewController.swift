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
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "검색 결과가 없습니다"
        return label
    }()
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
//        rxBind()
        newBind()
    }
}

// Rx
extension SearchHomeViewController: UISearchBarDelegate {
    
    private func newBind() {
        let input = SearchViewModel.Input(searchText: searchController.searchBar.rx.text.orEmpty,
                                          searchButtonTap: searchController.searchBar.rx.searchButtonClicked)
        let output = viewModel.newTransform(input: input)
        
        output.apppList
            .drive(tableView.rx.items(cellIdentifier: ResultTableViewCell.id, cellType: ResultTableViewCell.self)) { (row, appp, cell) in
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
    
    private func rxBind() {
        let input = SearchViewModel.Input(searchText: searchController.searchBar.rx.text.orEmpty,
                                          searchButtonTap: searchController.searchBar.rx.searchButtonClicked)
        let output = viewModel.transform(input: input)
        
        output.apppList
            .bind(with: self) { owner, appps in
                if appps.isEmpty {
                    DispatchQueue.main.async {
                        owner.emptyLabel.isHidden = false
                        owner.tableView.isHidden = true
                    }
                } else {
                    DispatchQueue.main.async {
                        owner.emptyLabel.isHidden = true
                        owner.tableView.isHidden = false
                    }
                }
            }
            .disposed(by: disposeBag)
        
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
        
        view.addSubview(emptyLabel)
        view.addSubview(tableView)
        
        emptyLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyLabel.isHidden = true
    }
}

