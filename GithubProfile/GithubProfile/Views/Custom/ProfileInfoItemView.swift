//
//  ProfileInfoItemView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import UIKit

class ProfileInfoItemView: UIView {
    lazy private var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = ColorFactory.label
        return label
    }()
    lazy private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = ColorFactory.label
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
        addSubview(countLabel)
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.topAnchor.constraint(equalTo: topAnchor),

            textLabel.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor, constant: 4),
            textLabel.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor),
        ])
    }
}


// MARK: - Public API
extension ProfileInfoItemView {
    func set(text: String, withCount count: Int) {
        countLabel.text = "\(count)"
        textLabel.text = text
    }
}
