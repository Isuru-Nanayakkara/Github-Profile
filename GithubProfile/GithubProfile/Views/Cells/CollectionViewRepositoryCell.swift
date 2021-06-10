//
//  CollectionViewRepositoryCell.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class CollectionViewRepositoryCell: UICollectionViewCell {
    lazy private var repoView: RepoSummaryView = {
        let view = RepoSummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(repoView)
        
        let padding: CGFloat = 14
        NSLayoutConstraint.activate([
            repoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            repoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            repoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            repoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }
}

// MARK: - Public API
extension CollectionViewRepositoryCell {
    func configure(with repository: Repository) {
        repoView.set(repository)
    }
}
