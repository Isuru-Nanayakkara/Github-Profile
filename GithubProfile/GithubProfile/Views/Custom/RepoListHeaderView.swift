//
//  RepoListHeaderView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-10.
//

import UIKit

class RepoListHeaderView: UIView {
    lazy private var repoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = ColorFactory.label
        return label
    }()
    lazy private var allButton: UIButton = {
        let title = NSAttributedString(string: "View All", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium),
            NSAttributedString.Key.foregroundColor: ColorFactory.label,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(title, for: .normal)
        return button
    }()
    
    
    var title: String? {
        get {
            return repoNameLabel.text
        }
        set {
            repoNameLabel.text = newValue
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    convenience init(title: String, frame: CGRect) {
        self.init(frame: frame)
        
        repoNameLabel.text = title
    }
    
    private func commonInit() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(repoNameLabel)
        addSubview(allButton)
        NSLayoutConstraint.activate([
            allButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            allButton.topAnchor.constraint(equalTo: topAnchor),
            allButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            allButton.widthAnchor.constraint(equalToConstant: 80),
            
            repoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            repoNameLabel.centerYAnchor.constraint(equalTo: allButton.centerYAnchor),
            repoNameLabel.trailingAnchor.constraint(equalTo: allButton.leadingAnchor, constant: -10),
        ])
    }
}
