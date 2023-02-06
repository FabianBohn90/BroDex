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


func setBgLabel(label: UILabel, typeName: String){
    switch typeName{
    case "fire":      label.backgroundColor = #colorLiteral(red: 0.816, green: 0.255, blue: 0.153, alpha: 1.0)
    case "grass":     label.backgroundColor = #colorLiteral(red: 0.376, green: 0.694, blue: 0.22, alpha: 1.0)
    case "water":     label.backgroundColor = #colorLiteral(red: 0.125, green: 0.51, blue: 0.898, alpha: 1.0)
    case "steel":     label.backgroundColor = #colorLiteral(red: 0.525, green: 0.522, blue: 0.667, alpha: 1.0)
    case "bug":       label.backgroundColor = #colorLiteral(red: 0.616, green: 0.663, blue: 0.078, alpha: 1.0)
    case "flying":    label.backgroundColor = #colorLiteral(red: 0.439, green: 0.518, blue: 0.855, alpha: 1.0)
    case "normal":    label.backgroundColor = #colorLiteral(red: 0.545, green: 0.478, blue: 0.373, alpha: 1.0)
    case "poison":    label.backgroundColor = #colorLiteral(red: 0.569, green: 0.231, blue: 0.51, alpha: 1.0)
    case "electric":  label.backgroundColor = #colorLiteral(red: 0.867, green: 0.643, blue: 0.047, alpha: 1.0)
    case "ground":    label.backgroundColor = #colorLiteral(red: 0.694, green: 0.557, blue: 0.157, alpha: 1.0)
    case "fairy":     label.backgroundColor = #colorLiteral(red: 0.839, green: 0.529, blue: 0.839, alpha: 1.0)
    case "fighting":  label.backgroundColor = #colorLiteral(red: 0.498, green: 0.2, blue: 0.11, alpha: 1.0)
    case "psychic":   label.backgroundColor = #colorLiteral(red: 0.812, green: 0.247, blue: 0.447, alpha: 1.0)
    case "rock":      label.backgroundColor = #colorLiteral(red: 0.627, green: 0.525, blue: 0.192, alpha: 1.0)
    case "ghost":     label.backgroundColor = #colorLiteral(red: 0.247, green: 0.247, blue: 0.584, alpha: 1.0)
    case "ice":       label.backgroundColor = #colorLiteral(red: 0.129, green: 0.659, blue: 0.776, alpha: 1.0)
    case "dragon":    label.backgroundColor = #colorLiteral(red: 0.388, green: 0.278, blue: 0.824, alpha: 1.0)
    case "dark":      label.backgroundColor = #colorLiteral(red: 0.325, green: 0.247, blue: 0.204, alpha: 1.0)
        
    default:
        return
    }
}
