//
//  RepositoryView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class RepoSummaryView: UIView {
    lazy private var ownerAvatarImageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy private var ownerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline).withSize(16)
        label.textColor = ColorFactory.secondaryLabel
        return label
    }()
    lazy private var repoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = ColorFactory.label
        return label
    }()
    lazy private var repoDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(15)
        label.textColor = ColorFactory.secondaryLabel
        label.numberOfLines = 2
        return label
    }()
    private lazy var infoViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 80
        return stackView
    }()
    private lazy var starsItemView = RepoInfoItemView()
    private lazy var languageItemView = RepoInfoItemView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = ColorFactory.tertiarySystemBackground
        layer.borderColor = ColorFactory.systemGray4.cgColor
        layer.borderWidth = 0.7
        layer.cornerRadius = 8
        clipsToBounds = true
        
        setupAvatarImageView()
        setupOwnerNameLabel()
        setupRepoNameLabel()
        setupRepoDescriptionLabel()
        setupInfoItemViews()
    }
}

// MARK: - Public API
extension RepoSummaryView {
    func set(_ repository: Repository) {
        ownerAvatarImageView.loadImage(from: repository.ownerAvatar, placeholder: UIImage(named: "placeholder_avatar"))
        ownerNameLabel.text = repository.ownerName
        repoNameLabel.text = repository.name
        repoDescriptionLabel.text = repository.description
        starsItemView.set(infoType: .stars, iconColor: .systemYellow, withText: repository.stars.formatUsingAbbrevation())
        languageItemView.set(infoType: .language, iconColor: UIColor(repository.languageColor), withText: repository.langauge)
    }
}

// UI Setup
private extension RepoSummaryView {
    private func setupAvatarImageView() {
        addSubview(ownerAvatarImageView)
        NSLayoutConstraint.activate([
            ownerAvatarImageView.heightAnchor.constraint(equalToConstant: 36),
            ownerAvatarImageView.widthAnchor.constraint(equalToConstant: 36),
            ownerAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            ownerAvatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
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
    
    private func setupInfoItemViews() {
        infoViewsStackView.addArrangedSubview(starsItemView)
        infoViewsStackView.addArrangedSubview(languageItemView)
        
        addSubview(infoViewsStackView)
        NSLayoutConstraint.activate([
            infoViewsStackView.topAnchor.constraint(equalTo: repoDescriptionLabel.bottomAnchor, constant: 20),
            infoViewsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
        ])
    }
}
