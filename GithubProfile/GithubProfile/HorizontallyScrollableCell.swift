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
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CollectionViewRepositoryCell.self, forCellWithReuseIdentifier: CollectionViewRepositoryCell.reuseIdentifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(collectionView)
        
        let padding: CGFloat = 0
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 80),
            
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }

}

// MARK: - UICollectionViewDataSource
extension HorizontallyScrollableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewRepositoryCell.reuseIdentifier, for: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HorizontallyScrollableCell: UICollectionViewDelegate {
    
}
