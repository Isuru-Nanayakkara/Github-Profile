//
//  TableViewRepositoryCell.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class TableViewRepositoryCell: UITableViewCell {
    lazy private var repoView: RepoSummaryView = {
        let view = RepoSummaryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        contentView.backgroundColor = .systemBackground
        
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
extension TableViewRepositoryCell {
    func configure(withRepository repo: Repository) {
        repoView.set(repository: repo)
    }
}
