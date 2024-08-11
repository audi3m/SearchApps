//
//  ScreenshotView.swift
//  SearchApps
//
//  Created by J Oh on 8/9/24.
//

import UIKit
import SnapKit
import Kingfisher

final class ScreenshotView: UIView {
    
    var appp: Appp?
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ScreenshotView.layout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: ScreenshotCollectionViewCell.id)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(cellHeight())
        }
    }
}

extension ScreenshotView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appp?.screenshotUrls.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenshotCollectionViewCell.id, for: indexPath) as! ScreenshotCollectionViewCell
        if let url = appp?.allURLs()[indexPath.row] {
            cell.setImage(url: url)
        }
        return cell
    }   
}

extension ScreenshotView {
    static func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = screenWidth / 2.5
        let itemHeight = itemWidth * (696.0 / 392.0)
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 10 // Spacing between items
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    private func cellHeight() -> CGFloat {
        let layout = ScreenshotView.layout()
        return layout.itemSize.height
    }
}
