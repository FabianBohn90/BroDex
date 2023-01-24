//
//  DetailAttackVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 20.01.23.
//

import UIKit

class AttackDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var naviItems: UINavigationItem!
    @IBOutlet weak var bgGradientIV: UIImageView!
    
    var pokemon: Results?
    var pokeData: Pokemon?
    var moveData: Move?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemon = DataManager.shared.pokemon
        pokeData = DataManager.shared.pokeData
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setTransparentNavBar(navBar: navigationBar)
        
        naviItems.title = translatePokemonName(englishName: pokemon!.name)
        naviItems.title?.append(" #\( pokeData?.id ?? 0)")
        
        setGradientBG(name: pokeData?.types[0].type.name ?? "-", imageView: self.bgGradientIV)
    }
    

    @IBAction func backBarBtn(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension AttackDetailVC : UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeData?.moves.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath) as? MoveTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        
        cell.moveNameLabel.text = pokeData?.moves[indexPath.row].move.name
        
        cell.contentView.layer.cornerRadius = 20
        
        fetchMove(URL: pokeData?.moves[indexPath.row].move.url ?? "-"){result in
            self.moveData = result
            
            DispatchQueue.main.async {
                cell.moveGenLabel.text = "\(self.moveData?.accuracy ?? 0)"
                cell.moveApLabel.text = "\(self.moveData?.pp ?? 0)"
                cell.movePowerLabel.text = "\(self.moveData?.power ?? 0)"
                cell.moveTypeLabel.text = self.moveData?.type.name
                cell.moveNameLabel.text = self.moveData?.names[4].name
                
                
            }
        }
        
        return cell
    }
    
    
}


