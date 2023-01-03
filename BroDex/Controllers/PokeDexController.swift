//
//  ViewController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit
import SDWebImage

class PokeDexController: UIViewController {
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=60"
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

//MARK: TabelView Setup

extension PokeDexController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let contentOffset = scrollView.contentOffset.y
            let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
            let deltaOffset = maximumOffset - contentOffset
            
            if deltaOffset <= 0 {
                // The user has reached the bottom of the table view.
                // Fetch the next page of data and reload the table view.
                fetchingAPIImages(URL: data?.next ?? "Error"){
                    result in self.data = result
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
            }
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as? PokeTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.backgroundColor = CGColor(red: 0.2, green: 0.6, blue: 0.2, alpha: 0.6)
       
        cell.pokeLB.text = data?.results[indexPath.row].name
        
        let urlData =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(indexPath.row + 1).png"
        cell.pokeIV.sd_setImage(with: URL(string: urlData), placeholderImage: UIImage(named: "splash screen"))
        
        return cell
    }
    
}
