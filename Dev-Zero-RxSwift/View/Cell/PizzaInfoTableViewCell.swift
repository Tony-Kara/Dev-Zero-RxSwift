//
//  PizzaInfoTableViewCell.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/18/23.
//

import Foundation
import UIKit

final class PizzaInfoTableViewCell: UITableViewCell {
    static let identifier = "PizzaTableViewCell"
    
    private lazy var containerView = UIView()
    
    private lazy var pizzaPriceView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.hammer_TextColor_pizzaPrice.cgColor
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
      var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pizzaPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .hammer_TextColor_pizzaPrice
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pizzaDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .hammer_TextColor_pizzaDescription
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
        
        
        containerView.layer.cornerRadius = 16
    }
    
    private func setUpSubviews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        [pizzaNameLabel, pizzaImageView , pizzaDescriptionLabel , pizzaPriceView ].forEach {
            containerView.addSubview($0)
        }
        pizzaPriceView.addSubview(pizzaPriceLabel)
       
        setupInitialLayout()
    }
    
    private func setupInitialLayout() {
        
        NSLayoutConstraint.activate([

            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            pizzaImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
            pizzaImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            pizzaImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 132),
            pizzaImageView.widthAnchor.constraint(equalToConstant: 132),

            pizzaNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            pizzaNameLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: 32),

            pizzaDescriptionLabel.topAnchor.constraint(equalTo: pizzaNameLabel.bottomAnchor, constant: 8),
            pizzaDescriptionLabel.leadingAnchor.constraint(equalTo: pizzaNameLabel.leadingAnchor),
            pizzaDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),

            pizzaPriceView.topAnchor.constraint(equalTo: pizzaDescriptionLabel.bottomAnchor, constant: 16),
            pizzaPriceView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            pizzaPriceView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            pizzaPriceView.heightAnchor.constraint(equalToConstant: 32),
            pizzaPriceView.widthAnchor.constraint(equalToConstant: 87),

            pizzaPriceLabel.centerXAnchor.constraint(equalTo: pizzaPriceView.centerXAnchor),
            pizzaPriceLabel.centerYAnchor.constraint(equalTo: pizzaPriceView.centerYAnchor)
        ])
    }
    
    //MARK: - Public Function
    
    func configure(model:MenuItem, image:UIImage) {
        DispatchQueue.main.async { [self] in
            pizzaImageView.image = image
            pizzaNameLabel.text = model.name
            pizzaDescriptionLabel.text = model.description
            pizzaPriceLabel.text = model.price
        }
    }
    
    
    func configure(model: MenuItem) {
        pizzaNameLabel.text = model.name
    }
    
}
