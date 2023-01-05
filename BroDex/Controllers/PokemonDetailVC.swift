//
//  PokemonDetailVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 05.01.23.
//

import UIKit
import SDWebImage

class PokemonDetailVC: UIViewController {
    
    var pokemonIndex: Int?
    var Pokemon: Results?
    
    

    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlData =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonIndex! + 1).png"
        
        pokeIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "splash screen"))
        
        nameLabel.text = Pokemon?.name
    }
    
    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}
