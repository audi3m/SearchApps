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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
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
        
    }
}

extension RecentSearchTermsViewController {
    
    private func configureView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
         
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
