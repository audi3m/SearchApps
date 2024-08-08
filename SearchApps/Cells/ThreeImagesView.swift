//
//  ThreeImagesView.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit

final class ThreeImagesView: UIView {
    
    let image1View: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    let image2View: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    let image3View: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(image1View)
        addSubview(image2View)
        addSubview(image3View)
        
        image1View
        
        
    }
    
    func configureData(urls: [String]) {
        
        
        
    }
    
}
