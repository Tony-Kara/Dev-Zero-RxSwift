//
//  BannerCellFlowLayout.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/18/23.
//

import Foundation
import UIKit


final class BannerCellFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        
        sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        let screenSize = UIScreen.main.bounds.width - 32
        let widthSize = screenSize / 1.5
        
        if screenSize <= 321 {
            itemSize = .init(width: widthSize, height: 96)
        }
        else {
            itemSize = .init(width: widthSize, height: 112)
        }
        
    }
    
    
}
