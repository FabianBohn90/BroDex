//
//  TabBarController.swift
//  BroDex
//
//  Created by Fabian Bohn on 20.01.23.
//

import UIKit

class TabBarController: UITabBarController {
    
    var pokemon: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let controllers = viewControllers {
            for vc in controllers {
                if let pokemon = pokemon {
                    (vc as? PokemonDetailVC)?.pokemon = pokemon
                }
            }
        }
    }
}
