//
//  RepositoryView.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class RepositoryView: UIView {
    lazy private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        backgroundColor = .systemGray
        setupLabel()
        label.text = repository.name
    }
    
    private func setupLabel() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
