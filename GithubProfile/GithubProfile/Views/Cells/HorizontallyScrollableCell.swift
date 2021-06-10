//
//  HorizontallyScrollableCell.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class HorizontallyScrollableCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    lazy private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: HorizontalScrollLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CollectionViewRepositoryCell.self, forCellWithReuseIdentifier: CollectionViewRepositoryCell.reuseIdentifier)
        return collectionView
    }()
    
    private var repositories: [Repository] = []
    
    
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
        
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}

// MARK: - UICollectionViewDataSource
extension HorizontallyScrollableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewRepositoryCell.reuseIdentifier, for: indexPath) as! CollectionViewRepositoryCell
        
        let repository = repositories[indexPath.item]
        cell.configure(with: repository)
        
        return cell
    }
}

// MARK: - Public API
extension HorizontallyScrollableCell {
    func configure(withRepositories repos: [Repository]) {
        repositories = repos
        collectionView.reloadData()
    }
}
