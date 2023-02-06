//
//  TypeDexController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class TypeDexController: UIViewController {
    let typeUrl = "https://pokeapi.co/api/v2/type/4"
    var types: Types?

    @IBOutlet var doubleDmgFromLabels: [UILabel]!
    @IBOutlet var halfDmgFromLabels: [UILabel]!
    @IBOutlet var noDmgFromLabels: [UILabel]!
    
    
    @IBOutlet var doubleDmgToLabels: [UILabel]!
    @IBOutlet var halfDmgToLabels: [UILabel]!
    @IBOutlet var noDmgToLabels: [UILabel]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTypes(URL: typeUrl){result in
            self.types = result
            
            print("\(String(describing: self.types))")
            
            DispatchQueue.main.async {
                
                for i in 0..<self.types!.damage_relations.double_damage_from!.count {
                    self.doubleDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.double_damage_from![i].name)
                    self.doubleDmgFromLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.half_damage_from!.count {
                    self.halfDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.half_damage_from![i].name)
                    self.halfDmgFromLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.no_damage_from!.count {
                    self.noDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.no_damage_from![i].name)
                    self.noDmgFromLabels[i].isHidden = false
                    
                }
                
                     for i in 0..<self.types!.damage_relations.double_damage_to!.count {
                    self.doubleDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.double_damage_to![i].name)
                    self.doubleDmgToLabels[i].isHidden = false
                    
                }
                
                     for i in 0..<self.types!.damage_relations.half_damage_to!.count {
                    self.halfDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.half_damage_to![i].name)
                    self.halfDmgToLabels[i].isHidden = false
                    
                }
                
                     for i in 0..<self.types!.damage_relations.no_damage_to!.count {
                    self.noDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.no_damage_to![i].name)
                    self.noDmgToLabels[i].isHidden = false
                    
                }
            }
        }
    }
}
