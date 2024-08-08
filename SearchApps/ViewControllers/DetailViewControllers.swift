//
//  DetailViewControllers.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit

final class DetailViewControllers: UIViewController {
    
    let myLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(myLabel)
        myLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        myLabel.text = "asdasdas"
        
    }
}
