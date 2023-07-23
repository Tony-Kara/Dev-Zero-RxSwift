//
//  DrinksToGoTableViewCell.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/22/23.
//


import Foundation
import UIKit

final class DrinksToGoTableViewCell: UITableViewCell {
    static let identifier = "DrinksTableViewCell"
    
    
    var drinksNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.hammer_TextColor_pizzaPrice
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Function
    
    private func configureView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    private func setUpSubviews() {
        contentView.addSubview(drinksNameLabel)
        setupInitialLayout()
    }
    
    private func setupInitialLayout() {
        
        NSLayoutConstraint.activate([
            drinksNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            drinksNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    //MARK: - Public Function
    
    func configure(drink: String) {
        DispatchQueue.main.async { [self] in
            drinksNameLabel.text = drink
        }
    }
}
