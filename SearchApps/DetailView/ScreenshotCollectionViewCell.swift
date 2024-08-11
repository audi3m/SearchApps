//
//  ScreenshotCollectionViewCell.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit
import Kingfisher

final class ScreenshotCollectionViewCell: UICollectionViewCell {
    static let id = "ScreenshotCollectionViewCell"

    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(url: URL?) {
        imageView.kf.setImage(with: url)
    }
    
}
