//
//  MenuCatergoryCell.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/22/23.
//

import UIKit

final class MenuCatergoryCell: UICollectionViewCell {
    static let identifier = "MenuCatCell"
    
    //MARK: - Private Properties
    
    private lazy var categoryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    override var isSelected: Bool {
        didSet {
            updateViewColors()
        }
    }
   
    private var defaultTextColor: UIColor = .black
    private var highlightedTextColor: UIColor = .hammer_TextColor_pizzaPrice
    private var defaultBackgroundColor: UIColor = .white
    private var selectedBackgroundColor: UIColor = .black.withAlphaComponent(0.3)
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 16
        if #available(iOS 13.0, *) {
            contentView.layer.cornerCurve = .circular
        }
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.hammer_menuCat_borderColor.cgColor
    }
    
   //MARK: - Private functions
    
    private func updateViewColors() {
        if isSelected {
            categoryLabel.textColor = highlightedTextColor
            contentView.backgroundColor = selectedBackgroundColor
        } else {
            categoryLabel.textColor = defaultTextColor
            contentView.backgroundColor = defaultBackgroundColor
        }
    }
    //MARK: - Public functions
    
    func insertData(categoryType: CategoryTypes) {
        contentView.addSubview(categoryLabel)
        categoryLabel.text =  categoryType.menuType?.title
        
        if let icon = categoryType.menuType?.icon {
            contentView.addSubview(iconImageView)
            let image = UIImage(systemName: icon)
            iconImageView.image = image
            
            NSLayoutConstraint.activate([
            
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.heightAnchor.constraint(equalToConstant: 24),
                iconImageView.widthAnchor.constraint(equalToConstant: 24),
                
                categoryLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 4),
                categoryLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor)
            ])
        }
        else {
            NSLayoutConstraint.activate([
                categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        }
    }
}
