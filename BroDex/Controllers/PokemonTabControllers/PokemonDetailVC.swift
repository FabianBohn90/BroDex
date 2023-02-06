//
//  PokemonDetailVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 05.01.23.
//

import UIKit
import Kingfisher


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
    @IBOutlet weak var abilitieThreeBtn: UIButton!
    
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
        
        setTransparentNavBar(navBar: navigationBar)
        
        navigationBar.barStyle = .default

        
        fetchPokemon(URL: pokemon?.url ?? "error"){result in
            self.pokeData = result
            DataManager.shared.pokeData = self.pokeData
            DispatchQueue.main.async {
                self.nameLabel.text = translatePokemonName(englishName: self.pokeData!.name)
                self.nameLabel.text?.append(" #\( self.pokeData?.id ?? 0)")
                
                self.naviItems.title = translatePokemonName(englishName: self.pokeData!.name)
                self.naviItems.title?.append(" #\( self.pokeData?.id ?? 0)")
                
                let urlData = URL(string:self.pokeData?.sprites.other.propertyWithHyphen.front_default ?? "https://i.ibb.co/W2bWG2Q/missingno.png")
                let processor = DownsamplingImageProcessor(size: self.pokeIV.bounds.size)
                self.pokeIV.kf.setImage(
                    with: urlData,
                    placeholder: UIImage(named: "splash screen"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.2)),
                        .cacheOriginalImage
                    ])
                {
                        result in
                        switch result {
                        case .success(let value):
                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                        case .failure(let error):
                            print("Job failed: \(error.localizedDescription)")
                        }
                    }
                
                
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
                
                setGradientBG(name: self.pokeData?.types[0].type.name ?? "-", imageView: self.bgGradientIV)
                
                
                if self.pokeData?.types.count == 1 {
                    self.typeOneLabel.text = translateTypeName(englishName: (self.pokeData?.types[0].type.name)!)
                    self.typeTwoLabel.isHidden = true
                    
                }else{
                    self.typeOneLabel.text = translateTypeName(englishName: (self.pokeData?.types[0].type.name)!)
                    self.typeTwoLabel.text = translateTypeName(englishName: (self.pokeData?.types[1].type.name)!)
                }
                
                
                switch self.pokeData?.abilities.count {
                case 1 : fetchAbilities(URL: (self.pokeData?.abilities[0].ability.url)!){result in
                    self.abilitiesData = result
                    
                    DispatchQueue.main.async {
                        self.abilitieOneBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name , for: .normal)
                        self.abilitieTwoBtn.isHidden = true
                    }
                }
                    self.abilitieOneBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name , for: .normal)
                    self.abilitieTwoBtn.isHidden = true
                    self.abilitieThreeBtn.isHidden = true
                    
                case 2 : fetchAbilities(URL: (self.pokeData?.abilities[0].ability.url)!){result in
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
                    self.abilitieThreeBtn.isHidden = true
                    
                case 3 : fetchAbilities(URL: (self.pokeData?.abilities[0].ability.url)!){result in
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
                    fetchAbilities(URL: (self.pokeData?.abilities[2].ability.url)!){result in
                        self.abilitiesData = result
                        DispatchQueue.main.async {
                            self.abilitieThreeBtn.setTitle(self.abilitiesData?.names[4].name ?? self.abilitiesData?.name, for: .normal)
                        }
                    }
                    
                case .none:
                    self.abilitieOneBtn.isHidden = true
                    self.abilitieTwoBtn.isHidden = true
                    self.abilitieThreeBtn.isHidden = true
                case .some(_):
                    return
                }
            }
        }
        
        
    }
    
    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

