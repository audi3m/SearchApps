//
//  TestViewController.swift
//  SearchApps
//
//  Created by J Oh on 8/9/24.
//

import UIKit
import SnapKit

final class TestViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        let leftLabel = UILabel()
        leftLabel.text = "Leftesfsafsd"
        leftLabel.textAlignment = .left
        
        let centerLabel = UILabel()
        centerLabel.text = "Centerdrherssregs"
        centerLabel.textAlignment = .center
        
        let rightLabel = UILabel()
        rightLabel.text = "Right"
        rightLabel.textAlignment = .right
        
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(centerLabel)
        stackView.addArrangedSubview(rightLabel)
        
        view.addSubview(stackView)
        
        // SnapKit을 사용한 제약 조건 설정
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.centerY.equalTo(view)
        }
        
    }
}
