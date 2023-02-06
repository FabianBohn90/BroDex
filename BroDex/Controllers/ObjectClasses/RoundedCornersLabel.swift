//
//  RoundedCornersLabel.swift
//  BroDex
//
//  Created by Fabian Bohn on 11.01.23.
//
import UIKit

class RoundedCornersLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
