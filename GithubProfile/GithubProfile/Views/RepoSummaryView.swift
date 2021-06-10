//
//  RepositoryView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class RepoSummaryView: UIView {
    lazy private var ownerAvatarImageView: UIImageView = {
        let imageView = RoundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "placeholder")
        return imageView
    }()
    lazy private var ownerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline).withSize(16)
        label.textColor = .secondaryLabel
        label.text = "Isuru-Nanayakkara"
        return label
    }()
    lazy private var repoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        label.text = "InstagramAuthViewController"
        return label
    }()
    lazy private var repoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(15)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.text = "A ViewController for Instagram authentication made with love by Isuru."
        return label
    }()
    private lazy var infoViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 80
        return stackView
    }()
    private lazy var starsItemView: RepoInfoItemView = {
        let view = RepoInfoItemView()
        view.set(infoType: .stars, iconColor: .systemYellow, withText: "458")
        return view
    }()
    private lazy var languageItemView: RepoInfoItemView = {
        let view = RepoInfoItemView()
        view.set(infoType: .language, iconColor: .systemOrange, withText: "Swift")
        return view
    }()
    
    
    private var repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .tertiarySystemBackground
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 0.7
        layer.cornerRadius = 8
        clipsToBounds = true
        
        setupAvatarImageView()
        setupOwnerNameLabel()
        setupRepoNameLabel()
        setupRepoDescriptionLabel()
        setupInfoItemVIews()
    }
}

private extension RepoSummaryView {
    private func setupAvatarImageView() {
        addSubview(ownerAvatarImageView)
        NSLayoutConstraint.activate([
            ownerAvatarImageView.heightAnchor.constraint(equalToConstant: 36),
            ownerAvatarImageView.widthAnchor.constraint(equalToConstant: 36),
            
            ownerAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            ownerAvatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14)
        ])
    }
    
    private func setupOwnerNameLabel() {
        addSubview(ownerNameLabel)
        NSLayoutConstraint.activate([
            ownerNameLabel.centerYAnchor.constraint(equalTo: ownerAvatarImageView.centerYAnchor),
            ownerNameLabel.leadingAnchor.constraint(equalTo: ownerAvatarImageView.trailingAnchor, constant: 14),
            ownerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupRepoNameLabel() {
        addSubview(repoNameLabel)
        NSLayoutConstraint.activate([
            repoNameLabel.topAnchor.constraint(equalTo: ownerAvatarImageView.bottomAnchor, constant: 14),
            repoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            repoNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupRepoDescriptionLabel() {
        addSubview(repoDescriptionLabel)
        NSLayoutConstraint.activate([
            repoDescriptionLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 6),
            repoDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            repoDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupInfoItemVIews() {
        infoViewsStackView.addArrangedSubview(starsItemView)
        infoViewsStackView.addArrangedSubview(languageItemView)
        
        addSubview(infoViewsStackView)
        NSLayoutConstraint.activate([
            infoViewsStackView.topAnchor.constraint(equalTo: repoDescriptionLabel.bottomAnchor, constant: 20),
            infoViewsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
        ])
    }
}
