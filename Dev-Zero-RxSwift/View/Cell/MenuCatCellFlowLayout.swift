//
//  BannerCellFlowLayout.swift
//  H_TakeHome
//
//  Created by Tony-eniola on 6/24/23.
//

import UIKit

final class MenuCatCellFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        minimumLineSpacing = 5
        minimumInteritemSpacing = 0
        sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        let screenSize = UIScreen.main.bounds.width - 32
        let widthSize = screenSize / 3.5
        if screenSize <= 321 {
            itemSize = .init(width: widthSize, height: 32)
        }
        else {
            itemSize = .init(width: widthSize, height: 32)
        }
    }
}
