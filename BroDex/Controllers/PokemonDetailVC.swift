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
    var pokemon: Results?
    var pokeData: Pokemon?

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeOneLabel: UILabel!
    @IBOutlet weak var typeTwoLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilitieOneLabel: UILabel!
    @IBOutlet weak var abilitieTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPokemon(URL: pokemon?.url ?? "error"){result in
            self.pokeData = result
            
            DispatchQueue.main.async {
                self.nameLabel.text = self.pokeData?.name
                self.numberLabel.text?.append("\( self.pokeData?.id ?? 0)")
                
                guard let urlData = self.pokeData?.sprites.other.propertyWithHyphen.front_default else { return }
                self.pokeIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "splash screen"))
                
                if self.pokeData?.types.count == 1 {
                    self.typeOneLabel.text = self.pokeData?.types[0].type.name
                    self.typeTwoLabel.isHidden = true
                    
                }else{
                    self.typeOneLabel.text = self.pokeData?.types[0].type.name
                    self.typeTwoLabel.text = self.pokeData?.types[1].type.name
                }
                
                if self.pokeData?.abilities.count == 1 {
                    self.abilitieOneLabel.text = self.pokeData?.abilities[0].ability.name
                    self.abilitieTwoLabel.isHidden = true
                } else {
                    self.abilitieOneLabel.text = self.pokeData?.abilities[0].ability.name
                    self.abilitieTwoLabel.text = self.pokeData?.abilities[1].ability.name
                }
    }
//            print(String(describing: self.pokeData))
        }
        
        
        
        
        
        
    }
    
    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}
