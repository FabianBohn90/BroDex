//
//  setGradientBG.swift
//  BroDex
//
//  Created by Fabian Bohn on 24.01.23.
//

import Foundation
import UIKit


func setGradientBG (name: String,imageView : UIImageView){

switch name {
    case "fire"     : imageView.image = UIImage(named: "Fire Gradient")
    case "grass"    : imageView.image = UIImage(named: "Plant Gradient")
    case "water"    : imageView.image = UIImage(named: "Water Gradient")
    case "steel"    : imageView.image = UIImage(named: "Steele Gradient")
    case "ice"      : imageView.image = UIImage(named: "Ice Gradient")
    case "flying"   : imageView.image = UIImage(named: "Flying Gradient")
    case "poison"   : imageView.image = UIImage(named: "Poison Gradient")
    case "ground"   : imageView.image = UIImage(named: "Ground Gradient")
    case "bug"      : imageView.image = UIImage(named: "Bug Gradient")
    case "ghost"    : imageView.image = UIImage(named: "Ghost Gradient")
    case "normal"   : imageView.image = UIImage(named: "Normal Gradient")
    case "fairy"    : imageView.image = UIImage(named: "Fairy Gradient")
    case "fighting" : imageView.image = UIImage(named: "Fighting Gradient")
    case "electric" : imageView.image = UIImage(named: "Electro Gradient")
    case "dragon"   : imageView.image = UIImage(named: "Dragon Gradient")
    case "rock"     : imageView.image = UIImage(named: "Rock Gradient")
    case "psychic"  : imageView.image = UIImage(named: "Psycho Gradient")
    case "dark"     : imageView.image = UIImage(named: "Dark Gradient")

    default: imageView.image = UIImage(named: "Dark Gradient")
    }
}

func setTransparentNavBar(navBar : UINavigationBar) {
    navBar.barTintColor = UIColor.clear
    navBar.backgroundColor = UIColor.clear
    navBar.setBackgroundImage(UIImage(), for: .default)
    navBar.shadowImage = UIImage()
    navBar.isTranslucent = true
}
