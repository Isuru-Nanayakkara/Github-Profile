//
//  HorizontalScrollLayout.swift
//  GithubProfile
//
//  Created by Isuru Nanayakkara on 2021-06-09.
//

import UIKit

class HorizontalScrollLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        scrollDirection = .horizontal
//        minimumLineSpacing = 14
        itemSize = CGSize(width: 150, height: 80)
    }
}

