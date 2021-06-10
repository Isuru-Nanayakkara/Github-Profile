//
//  RepoInfoItemView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import UIKit

enum RepoInfoItemType {
    case stars
    case language
}

class RepoInfoItemView: UIView {
    lazy private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(14)
        label.textColor = .label
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(iconImageView)
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 16),
            iconImageView.widthAnchor.constraint(equalToConstant: 16),
            
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            textLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
        ])
    }
}

// MARK: - Public API
extension RepoInfoItemView {
    func set(infoType type: RepoInfoItemType, iconColor color: UIColor? = nil, withText text: String) {
        switch type {
        case .stars:
            iconImageView.image = UIImage(systemName: "star.fill")
        case .language:
            iconImageView.image = UIImage(systemName: "circle.fill")
        }
        iconImageView.tintColor = color
        textLabel.text = text
    }
}
