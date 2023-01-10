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

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var pokeIV: UIImageView!
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
                self.numberLabel.text?.append("\( self.pokeData?.id ?? 0)")
                
                guard let urlData = self.pokeData?.sprites.other.propertyWithHyphen.front_default else { return }
                self.pokeIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "splash screen"))
                
                
                self.hpNameLabel.text = self.pokeData?.stats[0].stat.name
                self.hpStatLabel.text = String(self.pokeData?.stats[0].base_stat ?? 0)
                
                self.attackNameLabel.text = self.pokeData?.stats[1].stat.name
                self.attackStatLabel.text = String(self.pokeData?.stats[1].base_stat ?? 0)
                
                self.defenseNameLabel.text = self.pokeData?.stats[2].stat.name
                self.defenseStatLabel.text = String(self.pokeData?.stats[2].base_stat ?? 0)
                
                self.specialAtkNameLabel.text = self.pokeData?.stats[3].stat.name
                self.specialAtkStatLabel.text = String(self.pokeData?.stats[3].base_stat ?? 0)
                
                self.specialDefNameLabel.text = self.pokeData?.stats[4].stat.name
                self.specialDefStatLabel.text = String(self.pokeData?.stats[4].base_stat ?? 0)
                
                self.speedNameLabel.text = self.pokeData?.stats[5].stat.name
                self.speedStatLabel.text = String(self.pokeData?.stats[5].base_stat ?? 0)
                
                
                self.heightLabel.text = "Höhe \(Double(self.pokeData!.height) / 10) m"
                self.weightLabel.text = "Gewicht \(Double(self.pokeData!.weight) / 10) kg"
                
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

