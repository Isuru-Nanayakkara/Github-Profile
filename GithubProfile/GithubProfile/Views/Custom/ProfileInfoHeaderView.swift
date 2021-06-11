//
//  ProfileInfoHeaderView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import UIKit

class ProfileInfoHeaderView: UIView {
    lazy private var avatarImageView: UIImageView = {
        let imageView = RoundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = ColorFactory.label
        return label
    }()
    lazy private var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline).withSize(16)
        label.textColor = ColorFactory.secondaryLabel
        return label
    }()
    lazy private var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = ColorFactory.label
        return label
    }()
    private lazy var infoViewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 100
        return stackView
    }()
    private lazy var followersInfoView = ProfileInfoItemView()
    private lazy var followingInfoView = ProfileInfoItemView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = ColorFactory.systemBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupAvatarImageView()
        setupNameLabel()
        setupUsernameLabel()
        setupEmailLabel()
        setupProfileInfoItemViews()
    }
    
    
}

// Public API
extension ProfileInfoHeaderView {
    func set(profile: Profile) {
        avatarImageView.image = UIImage(named: profile.avatar)
        nameLabel.text = profile.name
        usernameLabel.text = profile.username
        emailLabel.text = profile.email
        followersInfoView.set(text: "Followers", withCount: profile.followers)
        followingInfoView.set(text: "Following", withCount: profile.following)
    }
}

// UI Setup
private extension ProfileInfoHeaderView {
    private func setupAvatarImageView() {
        addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
        ])
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 14),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 14),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupUsernameLabel() {
        addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 14),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupEmailLabel() {
        addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
    }
    
    private func setupProfileInfoItemViews() {
        infoViewsStackView.addArrangedSubview(followersInfoView)
        infoViewsStackView.addArrangedSubview(followingInfoView)
        
        addSubview(infoViewsStackView)
        NSLayoutConstraint.activate([
            infoViewsStackView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            infoViewsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
        ])
    }
}
