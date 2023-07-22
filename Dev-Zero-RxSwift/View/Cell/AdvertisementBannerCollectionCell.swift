//
//  AdvertisementBannerCollectionCell.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/22/23.
//

import UIKit

 class AdvertisementBannerCollectionCell: UICollectionViewCell {
    static let identifier = "BannerCollectionCell"
    //MARK: - Private Properties
    
     private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpInitialLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setUpInitialLayout() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    private func configureView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    func set(image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}
