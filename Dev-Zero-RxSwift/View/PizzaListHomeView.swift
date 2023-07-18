//
//  PizzaListHomeView.swift
//  Dev-Zero-RxSwift
//
//  Created by Eniola Anthony on 7/18/23.
//

import Foundation
import UIKit


final class PizzaListHomeView: UIView {
    
    // MARK: - Private properties
    
    private lazy var backgroundView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Public properties
    
    lazy var bannerViewCollection: UICollectionView = {
        let layout = BannerCellFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var menuCatergoryCollectionView: UICollectionView = {
        let layout = MenuCatCellFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 156
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let tapToNextScreenBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Tap!!", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func pressedAction(sender: UIButton) {
        print("Button \(sender.tag) clicked")
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupInitialLayout()
        tapToNextScreenBtn.addTarget(self, action: #selector(self.pressedAction(sender:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupInitialLayout() {
    //    addSubview(backgroundView)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
//        [bannerViewCollection,menuCatergoryCollectionView, tapToNextScreenBtn, tableView].forEach { backgroundView.addSubview($0) }
        
//        NSLayoutConstraint.activate([
//
//            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
//            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            bannerViewCollection.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 5),
//            bannerViewCollection.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
//            bannerViewCollection.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
//            bannerViewCollection.heightAnchor.constraint(equalToConstant: 112),
//            bannerViewCollection.widthAnchor.constraint(equalToConstant: 300),
//
//            menuCatergoryCollectionView.topAnchor.constraint(equalTo: bannerViewCollection.bottomAnchor, constant: 24),
//            menuCatergoryCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
//            menuCatergoryCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
//            menuCatergoryCollectionView.heightAnchor.constraint(equalToConstant: 32),
//            menuCatergoryCollectionView.widthAnchor.constraint(equalToConstant: 88),
//
//            tapToNextScreenBtn.topAnchor.constraint(equalTo: menuCatergoryCollectionView.bottomAnchor, constant: 24),
//            tapToNextScreenBtn.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
//            tapToNextScreenBtn.heightAnchor.constraint(equalToConstant: 45),
//            tapToNextScreenBtn.widthAnchor.constraint(equalToConstant: 90),
//
//            tableView.topAnchor.constraint(equalTo: tapToNextScreenBtn.bottomAnchor, constant: 24),
//            tableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -15),
//            tableView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
//            tableView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
//        ])
        
    }
    
    
    
    
    
}
