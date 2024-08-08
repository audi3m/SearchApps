//
//  ResultTableViewCell.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit
import Kingfisher
import RxSwift
import RxCocoa

final class ResultTableViewCell: UITableViewCell {
    static let id = "ResultTableViewCell"
    
    var disposeBag = DisposeBag()
    var app: Appp?
    
    let logoImageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    let appLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    let downloadButton: UIButton = {
        let button = UIButton()
        return button
    }()
    let ratingView: UIView = {
        let view = UIView()
        return view
    }()
    let corpLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    let categoryLabel: UILabel = {
        let view = UILabel()
        
        return view
    }()
    
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(appLabel)
        contentView.addSubview(downloadButton)
        contentView.addSubview(ratingView)
        contentView.addSubview(corpLabel)
        contentView.addSubview(categoryLabel)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(60)
        }
        
        appLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(8)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-8)
            make.centerY.equalTo(logoImageView)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalTo(contentView).offset(-20)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(10)
            make.leading.equalTo(contentView).offset(20)
        }
        
        corpLabel.snp.makeConstraints { make in
            
        }
        
        categoryLabel.snp.makeConstraints { make in
            
        }
        
        
        
        
        
        
    }
    
    private func configureData() {
        guard let app else { return }
        
        let url = URL(string: app.artworkUrl60)
        logoImageView.kf.setImage(with: url)
        appLabel.text = app.trackName
        
        
        
        
    }
}
