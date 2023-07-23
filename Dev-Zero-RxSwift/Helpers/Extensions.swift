//
//  Color.swift
//  SwensonHe_WeatherApp
//
//  Created by Eniola Anthony on 6/24/23.
//

import UIKit

public extension UIColor {
  static let hammer_menuCat_borderColor = UIColor(hex: "#FD3A69")
  static let hammer_TextColor_menuCategory = UIColor(hex: "#FD3A69")
  static let hammer_TextColor_pizzaName = UIColor(hex: "#222831")
  static let hammer_TextColor_pizzaDescription = UIColor(hex: "#222831")
  static let hammer_TextColor_pizzaPrice = UIColor(hex: "#FD3A69")
  
}

public extension UIStackView {
  
  convenience init(
    views: [UIView],
    axis: NSLayoutConstraint.Axis = .horizontal,
    distribution: Distribution = .fill,
    alignment: Alignment = .fill,
    spacing: CGFloat = 0
  ) {
    self.init(arrangedSubviews: views)
    self.axis = axis
    self.distribution = distribution
    self.alignment = alignment
    self.spacing = spacing
  }
}



public extension UIStackView {
  func addArrangedSubviews(_ subviews: [UIView]) {
    subviews.forEach { subview in
      addArrangedSubview(subview)
    }
  }
  
  func insert(view: UIView, after arrangedSubview: UIView) {
    guard let insertIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
      return
    }
    insertArrangedSubview(view, at: insertIndex + 1)
  }
  
  func insert(view: UIView, before arrangedSubview: UIView) {
    guard let insertIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
      return
    }
    insertArrangedSubview(view, at: insertIndex)
  }
}


extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }
    // TODO:  Download files asynchronously
    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}

extension CALayer {
    func addDropShadowBottom(_ opacity: Float, radius: CGFloat) {
      shadowColor = UIColor.black.cgColor
      shadowOffset = CGSize(width: 1, height: 1)
      shadowRadius = radius
      shadowOpacity = opacity
    }
    
    func addDropRoundedShadow(_ opacity: Float) {
      shadowColor = UIColor.black.cgColor
      shadowOffset = .zero
      shadowRadius = 2
      shadowOpacity = opacity
    }
}

// MARK: - Hex colors

public extension UIColor {
  
  convenience init(hex: UInt32) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0x0000FF) / 255.0,
      alpha: CGFloat(1.0)
    )
  }
  
  convenience init(hex: String) {
    var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
    
    guard let intHex = UInt32(hexSanitized, radix: 16) else {
      fatalError("Incorrect string hex")
    }
    
    self.init(hex: intHex)
  }
}
