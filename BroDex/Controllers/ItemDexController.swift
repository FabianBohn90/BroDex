//
//  ItemDexController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class ItemDexController: UIViewController {
    
    let url = "https://pokeapi.co/api/v2/item?limit=80"
    var data: Response?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        
        fetchingAPIImages(URL: url) {
            result in self.data = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
}


extension ItemDexController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        
        
        cell.itemLB.text = data?.results[indexPath.row].name
        
        
        let urlData =
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/\(data!.results[indexPath.row].name).png"
        
        cell.itemIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "splash screen"))
        return cell
    }
    
    
}
