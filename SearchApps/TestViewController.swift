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
        stackView.axis = .horizontal // 수평 스택
        stackView.distribution = .equalSpacing // 서브뷰 사이에 균등한 간격
        stackView.alignment = .center // 서브뷰들을 수평 중앙에 정렬
        
        // 레이블 생성
        let leftLabel = UILabel()
        leftLabel.text = "Leftesfsafsd"
        leftLabel.textAlignment = .left
        
        let centerLabel = UILabel()
        centerLabel.text = "Centerdrherssregs"
        centerLabel.textAlignment = .center
        
        let rightLabel = UILabel()
        rightLabel.text = "Right"
        rightLabel.textAlignment = .right
        
        // 스택뷰에 레이블 추가
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(centerLabel)
        
        stackView.addArrangedSubview(rightLabel)
        
        // 스택뷰를 루트 뷰에 추가하고 제약 설정
        view.addSubview(stackView)
        
        // SnapKit을 사용한 제약 조건 설정
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.trailing.equalTo(view).offset(-20)
            make.centerY.equalTo(view)
        }
        
        // spacer들의 너비를 같게 설정하여 centerLabel이 가운데에 위치하도록
//        leftSpacer.snp.makeConstraints { make in
//            make.width.equalTo(rightSpacer.snp.width)
//        }
    }
}
