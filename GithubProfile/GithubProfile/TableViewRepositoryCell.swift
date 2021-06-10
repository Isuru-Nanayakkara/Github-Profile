//
//  TableViewRepositoryCell.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class TableViewRepositoryCell: UITableViewCell {
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
        
        let view = RepoSummaryView(repository: .init(name: "Test"))
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        
        let padding: CGFloat = 14
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }
    
}
