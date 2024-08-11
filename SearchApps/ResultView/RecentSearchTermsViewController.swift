//
//  RecentSearchTermsViewController.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit

final class RecentSearchTermsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.delegate = self
        view.dataSource = self
        view.rowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        return view
    }()
    private let recentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근검색"
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    lazy private  var deleteAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체삭제", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.addTarget(self, action: #selector(deleteAllRecent), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// functions
extension RecentSearchTermsViewController {
    @objc private func deleteAllRecent() {
        RecentTermUserDefualtHelper.shared.deleteAll()
        tableView.reloadData()
    }
}

// TableView
extension RecentSearchTermsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecentTermUserDefualtHelper.shared.recentTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let term = RecentTermUserDefualtHelper.shared.recentTerms[indexPath.row]
        cell.textLabel?.text = term
        return cell
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Home에 검색 결과 표시
    }
}

extension RecentSearchTermsViewController {
    
    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(recentLabel)
        view.addSubview(deleteAllButton)
        view.addSubview(tableView)
        
        recentLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view).offset(20)
            make.height.equalTo(30)
        }
        
        deleteAllButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view).offset(-20)
            make.height.equalTo(30)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(recentLabel.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
