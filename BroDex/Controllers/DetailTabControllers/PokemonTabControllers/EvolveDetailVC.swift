//
//  DetailEvolveVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 20.01.23.
//

import UIKit

class EvolveDetailVC: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var naviItems: UINavigationItem!
    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var bgGradientIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTransparentNavBar(navBar: navigationBar)
        
        let pokemon = DataManager.shared.pokemon
        let pokeData = DataManager.shared.pokeData
        
        naviItems.title = translatePokemonName(englishName: pokemon!.name)
        naviItems.title?.append(" #\( pokeData?.id ?? 0)")
        
        let urlData = pokeData?.sprites.other.propertyWithHyphen.front_default
        self.pokeIV.sd_setImage(with: URL(string: urlData ?? "https://i.ibb.co/W2bWG2Q/missingno.png"), placeholderImage: UIImage(named: "missingno"))
        
        setGradientBG(name: (pokeData?.types[0].type.name)!, imageView: self.bgGradientIV)
        
    }
    

    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

