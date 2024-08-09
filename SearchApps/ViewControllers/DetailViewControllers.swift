//
//  DetailViewControllers.swift
//  SearchApps
//
//  Created by J Oh on 8/8/24.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailViewControllers: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "kakao100")
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = .systemGray5
        return view
    }()
    private let appLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        label.text = "카카오 T - 택시, 대리, 주차, 바이크, 항공, 퀵"
        return label
    }()
    private let corpLabel: UILabel = {
        let label = UILabel()
        label.text = "Kakao Corp."
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13)
        label.text = "버전 5.13.0"
        return label
    }()
    private let updateDetailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    private let screenshotsView: UIView = {
        let view = UIView()
        return view
    }()
    private let descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureData(appp: dummyApp)
    }
}

// View & Data
extension DetailViewControllers {
    func configureData(appp: Appp) {
        let url = URL(string: appp.artworkUrl100)
        logoImageView.kf.setImage(with: url)
        appLabel.text = appp.trackName
        corpLabel.text = appp.artistName
        versionLabel.text = "버전" + appp.version
        updateDetailLabel.text = appp.releaseNotes
        descLabel.text = appp.description
    }
    
    private func configureView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(appLabel)
        contentView.addSubview(corpLabel)
        contentView.addSubview(downloadButton)
        contentView.addSubview(newsLabel)
        contentView.addSubview(versionLabel)
        contentView.addSubview(updateDetailLabel)
        contentView.addSubview(screenshotsView)
        contentView.addSubview(descLabel)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.size.equalTo(100)
        }
        
        appLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.top)
            make.leading.equalTo(logoImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        corpLabel.snp.makeConstraints { make in
            make.top.equalTo(appLabel.snp.bottom).offset(4)
            make.leading.equalTo(logoImageView.snp.trailing).offset(20)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.leading.equalTo(logoImageView.snp.trailing).offset(20)
            make.bottom.equalTo(logoImageView.snp.bottom)
            make.width.equalTo(72)
            make.height.equalTo(32)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(newsLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        updateDetailLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(20)
        }
        
        screenshotsView.snp.makeConstraints { make in
            make.top.equalTo(updateDetailLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(200)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(screenshotsView.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
