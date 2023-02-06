//
//  DetailEvolveVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 20.01.23.
//

import UIKit

class EvolveDetailVC: UIViewController {
    
    var pokeEvolveOne: Pokemon?
    var pokeEvolveTwo: Pokemon?
    var pokeEvolveThree: Pokemon?
    
    var pokemonSpecies: PokemonSpecies?
    var evolutionChain: EvolutionChain?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var naviItems: UINavigationItem!
    @IBOutlet weak var bgGradientIV: UIImageView!
    
    @IBOutlet weak var evolveOneIV: UIImageView!
    @IBOutlet weak var evolveTwoIV: UIImageView!
    @IBOutlet weak var evolveThreeIV: UIImageView!
    
    @IBOutlet weak var firstConditionNameLabel: UILabel!
    @IBOutlet weak var secondConditionNameLabel: UILabel!
    
    @IBOutlet weak var firstConditionLabel: UILabel!
    @IBOutlet weak var secondConditionLabel: UILabel!
    
    @IBOutlet weak var evolveStackView: UIStackView!
    @IBOutlet weak var levelStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barStyle = .default
        
        let pokemon = DataManager.shared.pokemon
        let pokeData = DataManager.shared.pokeData
        
        setGradientBG(name: (pokeData?.types[0].type.name)!, imageView: self.bgGradientIV)
        setTransparentNavBar(navBar: navigationBar)
        
        naviItems.title = translatePokemonName(englishName: pokemon!.name)
        naviItems.title?.append(" #\( pokeData?.id ?? 0)")
        
        //        let urlData = pokeData?.sprites.other.propertyWithHyphen.front_default
        //        self.pokeIV.sd_setImage(with: URL(string: urlData ?? "https://i.ibb.co/W2bWG2Q/missingno.png"), placeholderImage: UIImage(named: "missingno"))
        
        fetchPokemonSpecies(URL: (pokeData?.species.url)!) {result in
            self.pokemonSpecies = result
            
            DispatchQueue.main.async {
                fetchEvolutionChain(URL: (self.pokemonSpecies?.evolution_chain.url)!) {result in
                    self.evolutionChain = result
                    DispatchQueue.main.async {
                        
                        if self.evolutionChain?.chain.evolves_to?.count != 0 {
                            
                            self.firstConditionNameLabel.text = self.evolutionChain?.chain.evolves_to?[0].evolution_details[0].trigger?.name
                            self.firstConditionLabel.text = "\(self.evolutionChain?.chain.evolves_to?[0].evolution_details[0].min_level ?? 0)"
                            
                            if self.evolutionChain?.chain.evolves_to![0].evolves_to?.count != 0 {
                                self.secondConditionNameLabel.text = self.evolutionChain?.chain.evolves_to?[0].evolves_to?[0].evolution_details[0].trigger?.name
                                self.secondConditionLabel.text = "\(self.evolutionChain?.chain.evolves_to?[0].evolves_to?[0].evolution_details[0].min_level ?? 0)"
                                
                            }else {
                                self.levelStackView.isHidden = true
                                self.evolveThreeIV.isHidden = true
                            }
                        }else {
                            self.evolveStackView.isHidden = true
                        }
                        
                    }
                }
            }
        }
    }
    
    
    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

