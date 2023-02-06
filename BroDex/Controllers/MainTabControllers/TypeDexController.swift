//
//  TypeDexController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class TypeDexController: UIViewController {
    var typeUrl = "https://pokeapi.co/api/v2/type/4"
    var types: Types?

    
    @IBOutlet weak var SelectBtn: UIButton!
    
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
    
    @IBOutlet var doubleDmgFromLabels: [UILabel]!
    @IBOutlet var halfDmgFromLabels: [UILabel]!
    @IBOutlet var noDmgFromLabels: [UILabel]!
    
    
    @IBOutlet var doubleDmgToLabels: [UILabel]!
    @IBOutlet var halfDmgToLabels: [UILabel]!
    @IBOutlet var noDmgToLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstStackView.layer.cornerRadius = 20
        firstStackView.layer.masksToBounds = true

        firstStackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        firstStackView.isLayoutMarginsRelativeArrangement = true
        
        secondStackView.layer.cornerRadius = 20
        secondStackView.layer.masksToBounds = true

        secondStackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        secondStackView.isLayoutMarginsRelativeArrangement = true
        

    }
    
    
    func fetchTypesData(){
        fetchTypes(URL: typeUrl){result in
            self.types = result
            
            DispatchQueue.main.async {
                
                for i in 0..<self.types!.damage_relations.double_damage_from!.count {
                    setBgLabel(label: self.doubleDmgFromLabels[i], typeName: self.types!.damage_relations.double_damage_from![i].name)
                    self.doubleDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.double_damage_from![i].name)
                    self.doubleDmgFromLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.half_damage_from!.count {
                    setBgLabel(label: self.halfDmgFromLabels[i], typeName: self.types!.damage_relations.half_damage_from![i].name)
                    self.halfDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.half_damage_from![i].name)
                    self.halfDmgFromLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.no_damage_from!.count {
                    setBgLabel(label: self.noDmgFromLabels[i], typeName: self.types!.damage_relations.no_damage_from![i].name)
                    self.noDmgFromLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.no_damage_from![i].name)
                    self.noDmgFromLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.double_damage_to!.count {
                    setBgLabel(label: self.doubleDmgToLabels[i], typeName: self.types!.damage_relations.double_damage_to![i].name)
                    self.doubleDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.double_damage_to![i].name)
                    self.doubleDmgToLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.half_damage_to!.count {
                    setBgLabel(label: self.halfDmgToLabels[i], typeName: self.types!.damage_relations.half_damage_to![i].name)
                    self.halfDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.half_damage_to![i].name)
                    self.halfDmgToLabels[i].isHidden = false
                    
                }
                
                for i in 0..<self.types!.damage_relations.no_damage_to!.count {
                    setBgLabel(label: self.noDmgToLabels[i], typeName: self.types!.damage_relations.no_damage_to![i].name)
                    self.noDmgToLabels[i].text = translateTypeName(englishName: self.types!.damage_relations.no_damage_to![i].name)
                    self.noDmgToLabels[i].isHidden = false
                    
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSelectType"){
            guard let destination = segue.destination as? TypeSelectVC else {return}
            destination.delegate = self
        }
    }
}



extension TypeDexController: ChangeTypeDelegate {
    
    func applyChanges(urlData: String, type: String) {
        self.typeUrl = urlData
        
        for doubleDmgFromLabels in doubleDmgFromLabels {
            doubleDmgFromLabels.isHidden = true
            
        }
        
        for halfDmgFromLabels in halfDmgFromLabels {
            halfDmgFromLabels.isHidden = true
            
        }
        
        for noDmgFromLabels in noDmgFromLabels {
            noDmgFromLabels.isHidden = true
            
        }
        
        for doubleDmgToLabels in doubleDmgToLabels {
            doubleDmgToLabels.isHidden = true
            
        }
        
        for halfDmgToLabels in halfDmgToLabels {
            halfDmgToLabels.isHidden = true
            
        }
        
        for noDmgToLabels in noDmgToLabels {
            noDmgToLabels.isHidden = true
            
        }
        
        switch type{
        case "fire":      SelectBtn.tintColor = #colorLiteral(red: 0.816, green: 0.255, blue: 0.153, alpha: 1.0)
        case "grass":     SelectBtn.tintColor = #colorLiteral(red: 0.376, green: 0.694, blue: 0.22, alpha: 1.0)
        case "water":     SelectBtn.tintColor = #colorLiteral(red: 0.125, green: 0.51, blue: 0.898, alpha: 1.0)
        case "steel":     SelectBtn.tintColor = #colorLiteral(red: 0.525, green: 0.522, blue: 0.667, alpha: 1.0)
        case "bug":       SelectBtn.tintColor = #colorLiteral(red: 0.616, green: 0.663, blue: 0.078, alpha: 1.0)
        case "flying":    SelectBtn.tintColor = #colorLiteral(red: 0.439, green: 0.518, blue: 0.855, alpha: 1.0)
        case "normal":    SelectBtn.tintColor = #colorLiteral(red: 0.545, green: 0.478, blue: 0.373, alpha: 1.0)
        case "poison":    SelectBtn.tintColor = #colorLiteral(red: 0.569, green: 0.231, blue: 0.51, alpha: 1.0)
        case "electric":  SelectBtn.tintColor = #colorLiteral(red: 0.867, green: 0.643, blue: 0.047, alpha: 1.0)
        case "ground":    SelectBtn.tintColor = #colorLiteral(red: 0.694, green: 0.557, blue: 0.157, alpha: 1.0)
        case "fairy":     SelectBtn.tintColor = #colorLiteral(red: 0.839, green: 0.529, blue: 0.839, alpha: 1.0)
        case "fighting":  SelectBtn.tintColor = #colorLiteral(red: 0.498, green: 0.2, blue: 0.11, alpha: 1.0)
        case "psychic":   SelectBtn.tintColor = #colorLiteral(red: 0.812, green: 0.247, blue: 0.447, alpha: 1.0)
        case "rock":      SelectBtn.tintColor = #colorLiteral(red: 0.627, green: 0.525, blue: 0.192, alpha: 1.0)
        case "ghost":     SelectBtn.tintColor = #colorLiteral(red: 0.247, green: 0.247, blue: 0.584, alpha: 1.0)
        case "ice":       SelectBtn.tintColor = #colorLiteral(red: 0.129, green: 0.659, blue: 0.776, alpha: 1.0)
        case "dragon":    SelectBtn.tintColor = #colorLiteral(red: 0.388, green: 0.278, blue: 0.824, alpha: 1.0)
        case "dark":      SelectBtn.tintColor = #colorLiteral(red: 0.325, green: 0.247, blue: 0.204, alpha: 1.0)
            
        default:
            return
        }
        
        SelectBtn.setTitle(translateTypeName(englishName: type), for: .normal)
        
        fetchTypesData()
    }
    
    
}
