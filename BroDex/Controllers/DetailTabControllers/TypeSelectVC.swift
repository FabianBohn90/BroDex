//
//  TypeSelectVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 06.02.23.
//

import UIKit

protocol ChangeTypeDelegate{
    func applyChanges(urlData: String,type: String)
}

class TypeSelectVC: UIViewController {

    var delegate: ChangeTypeDelegate?
    
    
    @IBAction func fireBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/fire", type: "fire")
    }
    
    
    @IBAction func plantBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/grass", type: "grass")
    }
    
    
    @IBAction func waterBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/water", type: "water")
    }
    
    @IBAction func steelBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/steel", type: "steel")
    }
    
    @IBAction func bugBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/bug", type: "bug")
    }
    
    @IBAction func flyingBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/flying", type: "flying")
    }
    
    
    @IBAction func normalBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/normal", type: "normal")
    }
    
    
    @IBAction func poisonBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/poison", type: "poison")
    }
    
    
    @IBAction func electricBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/electric", type: "electric")
    }
    
    @IBAction func groundBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/ground", type: "ground")
    }
    
    
    @IBAction func fairyBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/fairy", type: "fairy")
    }
    
    @IBAction func fightingBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/fighting", type: "fighting")
    }
    
    @IBAction func psychicBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/psychic", type: "psychic")
    }
    
    
    @IBAction func rockBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/rock", type: "rock")
    }
    
    
    @IBAction func ghostBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/ghost", type: "ghost")
    }
    
    @IBAction func iceBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/ice", type: "ice")
    }
    
    
    @IBAction func dragonBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/dragon", type: "dragon")
    }
    
    
    @IBAction func darkBtn(_ sender: Any) {
        dismiss(animated: true)
        delegate?.applyChanges(urlData: "https://pokeapi.co/api/v2/type/dark", type: "dark")
    }
    
}
