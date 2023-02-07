//
//  DetailEvolveVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 20.01.23.
//

import UIKit
import Kingfisher

class EvolveDetailVC: UIViewController {
    
    var pokemonSpecies: PokemonSpecies?
    var evolutionChain: EvolutionChain?
    
    var baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    
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
        
        fetchPokemonSpecies(URL: (pokeData?.species.url)!) {result in
            self.pokemonSpecies = result
            
            DispatchQueue.main.async {
                fetchEvolutionChain(URL: (self.pokemonSpecies?.evolution_chain.url)!) {result in
                    self.evolutionChain = result
                    DispatchQueue.main.async {
                        
                        
                        self.fetchPokemonImage(pokeName: self.evolutionChain?.chain.species.name, imageView: self.evolveOneIV)
                        
                        if self.evolutionChain?.chain.evolves_to?.count != 0 {
                            
                            self.fetchPokemonImage(pokeName: self.evolutionChain?.chain.evolves_to![0].species.name, imageView: self.evolveTwoIV)
                            
                            if self.evolutionChain?.chain.evolves_to![0].evolves_to?.count != 0{
                                self.fetchPokemonImage(pokeName: self.evolutionChain?.chain.evolves_to![0].evolves_to![0].species.name, imageView: self.evolveThreeIV)
                                
                            }
                            
                        }
                        
                        
                        
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
    
    
    func fetchPokemonImage(pokeName: String?, imageView: UIImageView ) {
        var baseUrl = "https://pokeapi.co/api/v2/pokemon/"
        baseUrl.append(pokeName ?? "1")
        
        fetchPokemon(URL: baseUrl) {result in
            
            DispatchQueue.main.async {
                let urlData = URL(string: result.sprites.other.propertyWithHyphen.front_default ?? "https://i.ibb.co/W2bWG2Q/missingno.png")
                let processor = DownsamplingImageProcessor(size: self.evolveOneIV.bounds.size)
                
                imageView.kf.indicatorType = .activity
                imageView.kf.setImage (
                    with: urlData,
//                    placeholder: UIImage(named: "splash screen"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.2)),
                        .cacheOriginalImage
                    ]) {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    }
                
            }
        }
    }
    
    
    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

