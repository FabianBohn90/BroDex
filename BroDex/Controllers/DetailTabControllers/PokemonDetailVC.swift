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
    var abilitiesData: Abilities?

    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var naviItems: UINavigationItem!
    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var bgGradientIV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeOneLabel: UILabel!
    @IBOutlet weak var typeTwoLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var abilitieOneBtn: UIButton!
    @IBOutlet weak var abilitieTwoBtn: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var hpNameLabel: UILabel!
    @IBOutlet weak var hpStatLabel: UILabel!
    @IBOutlet weak var attackNameLabel: UILabel!
    @IBOutlet weak var attackStatLabel: UILabel!
    @IBOutlet weak var defenseNameLabel: UILabel!
    @IBOutlet weak var defenseStatLabel: UILabel!
    @IBOutlet weak var specialAtkNameLabel: UILabel!
    @IBOutlet weak var specialAtkStatLabel: UILabel!
    @IBOutlet weak var specialDefNameLabel: UILabel!
    @IBOutlet weak var specialDefStatLabel: UILabel!
    @IBOutlet weak var speedNameLabel: UILabel!
    @IBOutlet weak var speedStatLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor.clear
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        
        fetchPokemon(URL: pokemon?.url ?? "error"){result in
            self.pokeData = result
            
            DispatchQueue.main.async {
                self.nameLabel.text = translatePokemonName(englishName: self.pokeData!.name)
                self.nameLabel.text?.append(" #\( self.pokeData?.id ?? 0)")
                
                self.naviItems.title = translatePokemonName(englishName: self.pokeData!.name)
                self.naviItems.title?.append(" #\( self.pokeData?.id ?? 0)")
                
                guard let urlData = self.pokeData?.sprites.other.propertyWithHyphen.front_default else { return }
                self.pokeIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "missingno"))
                
                
                self.hpNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[0].stat.name)!)
                self.hpStatLabel.text = String(self.pokeData?.stats[0].base_stat ?? 0)
                
                self.attackNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[1].stat.name)!)
                self.attackStatLabel.text = String(self.pokeData?.stats[1].base_stat ?? 0)
                
                self.defenseNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[2].stat.name)!)
                self.defenseStatLabel.text = String(self.pokeData?.stats[2].base_stat ?? 0)
                
                self.specialAtkNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[3].stat.name)!)
                self.specialAtkStatLabel.text = String(self.pokeData?.stats[3].base_stat ?? 0)
                
                self.specialDefNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[4].stat.name)!)
                self.specialDefStatLabel.text = String(self.pokeData?.stats[4].base_stat ?? 0)
                
                self.speedNameLabel.text = translateStatsName(englishName: (self.pokeData?.stats[5].stat.name)!)
                self.speedStatLabel.text = String(self.pokeData?.stats[5].base_stat ?? 0)
                
                
                self.heightLabel.text = "Höhe \(Double(self.pokeData!.height) / 10) m"
                self.weightLabel.text = "Gewicht \(Double(self.pokeData!.weight) / 10) kg"
                
                switch self.pokeData?.types[0].type.name {
                case "fire" : self.bgGradientIV.image = UIImage(named: "Fire Gradient")
                case "grass" : self.bgGradientIV.image = UIImage(named: "Plant Gradient")
                case "water" : self.bgGradientIV.image = UIImage(named: "Water Gradient")
                case "steel" : self.bgGradientIV.image = UIImage(named: "Steele Gradient")
                case "ice" : self.bgGradientIV.image = UIImage(named: "Ice Gradient")
                case "flying" : self.bgGradientIV.image = UIImage(named: "Flying Gradient")
                case "poison" : self.bgGradientIV.image = UIImage(named: "Poison Gradient")
                case "ground" : self.bgGradientIV.image = UIImage(named: "Ground Gradient")
                case "bug" : self.bgGradientIV.image = UIImage(named: "Bug Gradient")
                case "ghost" : self.bgGradientIV.image = UIImage(named: "Ghost Gradient")
                case "normal" : self.bgGradientIV.image = UIImage(named: "Normal Gradient")
                case "fairy" : self.bgGradientIV.image = UIImage(named: "Fairy Gradient")
                case "fighting" : self.bgGradientIV.image = UIImage(named: "Fighting Gradient")
                case "electric" : self.bgGradientIV.image = UIImage(named: "Electro Gradient")
                case "dragon" : self.bgGradientIV.image = UIImage(named: "Dragon Gradient")
                case "rock" : self.bgGradientIV.image = UIImage(named: "Rock Gradient")
                case "psychic" : self.bgGradientIV.image = UIImage(named: "Psycho Gradient")
                case "dark" : self.bgGradientIV.image = UIImage(named: "Dark Gradient")
                case .none:
                    return
                case .some(_):
                    return
                }
                
                if self.pokeData?.types.count == 1 {
                    self.typeOneLabel.text = translateTypeName(englishName: (self.pokeData?.types[0].type.name)!)
                    self.typeTwoLabel.isHidden = true
                    
                }else{
                    self.typeOneLabel.text = translateTypeName(englishName: (self.pokeData?.types[0].type.name)!)
                    self.typeTwoLabel.text = translateTypeName(englishName: (self.pokeData?.types[1].type.name)!)
                }
                
                if self.pokeData?.abilities.count == 1 {
                    fetchAbilities(URL: (self.pokeData?.abilities[0].ability.url)!){result in
                    self.abilitiesData = result
                        
                        DispatchQueue.main.async {
                            self.abilitieOneBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name , for: .normal)
                            self.abilitieTwoBtn.isHidden = true
                        }
                }
                    self.abilitieOneBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name , for: .normal)
                    self.abilitieTwoBtn.isHidden = true
                } else {
                    fetchAbilities(URL: (self.pokeData?.abilities[0].ability.url)!){result in
                    self.abilitiesData = result
                        DispatchQueue.main.async {
                            self.abilitieOneBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name, for: .normal)
                        }
                }
                    fetchAbilities(URL: (self.pokeData?.abilities[1].ability.url)!){result in
                    self.abilitiesData = result
                        DispatchQueue.main.async {
                            self.abilitieTwoBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name, for: .normal)
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

