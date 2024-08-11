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
    var appp: Appp?
    
    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    private let appLabel: UILabel = {
        let view = UILabel()
        view.font = .boldSystemFont(ofSize: 17)
        return view
    }()
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 16
        return button
    }()
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center 
        view.addArrangedSubview(ratingView)
        view.addArrangedSubview(corpLabel)
        view.addArrangedSubview(categoryLabel)
        return view
    }()
    private let ratingView: UILabel = {
        let view = UILabel()
        view.text = "asdasd"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .secondaryLabel
        return view
    }()
    private let corpLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.text = "Kakao Mobility Corp."
        view.font = .systemFont(ofSize: 14)
        view.textColor = .secondaryLabel
        return view
    }()
    private let categoryLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .right
        view.text = "여행"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .secondaryLabel
        return view
    }()
    private lazy var imageStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .center
        view.spacing = 10
        view.addArrangedSubview(imageView1)
        view.addArrangedSubview(imageView2)
        view.addArrangedSubview(imageView3)
        return view
    }()
    private let imageView1: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private let imageView2: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private let imageView3: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
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
        contentView.addSubview(stackView)
        contentView.addSubview(imageStackView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.leading.equalTo(contentView).offset(20)
            make.size.equalTo(60)
        }
        
        appLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(8)
            make.trailing.equalTo(downloadButton.snp.leading).offset(-8)
            make.centerY.equalTo(logoImageView)
            make.height.equalTo(17)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.trailing.equalTo(contentView).offset(-20)
            make.width.equalTo(72)
            make.height.equalTo(32)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.bottom.equalTo(contentView).offset(-25)
        }
        
        let aspectRatio: CGFloat = 392.0 / 696.0
        imageView1.snp.makeConstraints { make in
            make.width.equalTo(imageView1.snp.height).multipliedBy(aspectRatio)
        }
        
        imageView2.snp.makeConstraints { make in
            make.width.equalTo(imageView2.snp.height).multipliedBy(aspectRatio)
        }
        
        imageView3.snp.makeConstraints { make in
            make.width.equalTo(imageView3.snp.height).multipliedBy(aspectRatio)
        }
        
    }
    
    func configureData() {
        guard let appp else { return }
        
        let logoUrl = URL(string: appp.icon60)
        logoImageView.kf.setImage(with: logoUrl)
        appLabel.text = appp.appTitle
        ratingView.text = appp.rating
        corpLabel.text = appp.corpName
        categoryLabel.text = appp.genres.first ?? ""
        
        setImages(with: appp.threeURLs())
    }
    
    private func setImages(with urls: [URL?]) {
        let imageViews = [imageView1, imageView2, imageView3]
        
        for (index, url) in urls.enumerated() {
            imageViews[index].kf.setImage(with: url)
        }
    }
}
