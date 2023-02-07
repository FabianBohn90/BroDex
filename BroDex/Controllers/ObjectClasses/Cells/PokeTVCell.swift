//
//  PokeTVCell.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class PokeTVCell: UITableViewCell {
    
    
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var imgBgView: UIView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
        
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        // Set the layout margins of the cell
////        contentView.frame = contentView.frame.inset(
////            by: UIEdgeInsets(
////                top: 6,
////                left: 6,
////                bottom: 6,
////                right: 6
////            )
////        )
    }
    

    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var pokeNameLB: UILabel!
    @IBOutlet weak var pokeNumberLB: UILabel!
    @IBOutlet weak var pokeType1LB: UILabel!
    @IBOutlet weak var pokeType2LB: UILabel!
    
    
}


extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.white.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1
    layer.cornerRadius = 8
    layer.borderWidth = 1
    layer.borderColor = UIColor.white.cgColor

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.cornerRadius = 8
    layer.borderWidth = 1
    layer.borderColor = color.cgColor

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
