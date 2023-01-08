//
//  ViewController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit
import SDWebImage

class PokeDexController: UIViewController {
    
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=40"
    var data: Response?
    var pokeData: Pokemon?
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        fetchData(URL: url) {result in
            
            switch result{
            case .success(let data):
                 self.data = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
        }
            case .failure(_):
                break
            }
        }
    }
}

//MARK: TabelView Setup

extension PokeDexController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    
    //Die Methode createSpinnerFooter() erstellt eine Ansicht mit einem UIActivityIndicatorView, der sich dreht, um anzuzeigen, dass die App Daten lädt.
    private func createSpinenrFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size .width, height: 94))
        let spinner = UIActivityIndicatorView()
        
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
            guard !isPaginating else {
                return
            }
            self.tableView.tableFooterView = createSpinenrFooter()
            
            // Fetch the next page of data and reload the table view.
            fetchData(paginating: true, URL: data?.next ?? "null"){ [weak self] result in
                DispatchQueue.main.async {
                    self?.tableView.tableFooterView = nil
                }
                switch result{
                case .success(let data):
                    self?.data?.results.append(contentsOf: data.results)
                    self?.data?.next = data.next
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as? PokeTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.backgroundColor = CGColor(red: 0.2, green: 0.2, blue: 0.6, alpha: 0.6)
        
        
        cell.pokeLB.text = translatePokemonName(englishName: (data?.results[indexPath.row].name)!)
        
        fetchPokemon(URL: (data?.results[indexPath.row].url)!) {result in
            self.pokeData = result
            
            DispatchQueue.main.async {
                let urlData = self.pokeData?.sprites.other.propertyWithHyphen.front_default
                cell.pokeIV.sd_setImage(with: URL(string: urlData!), placeholderImage: UIImage(named: "splash screen"))
            }
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let pokemon = data?.results[indexPath.row]
        let pokemonTuple = (indexPath.row,pokemon)
        
        
        performSegue(withIdentifier: "toPokemonDetail", sender: pokemonTuple)
        
        return indexPath
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toPokemonDetail" {
                
                guard let destinationVC = segue.destination as? PokemonDetailVC else { return }
                guard let PokemonTuple = sender as? (Int, Results) else  { return }
                
                destinationVC.pokemonIndex = PokemonTuple.0
                destinationVC.pokemon = PokemonTuple.1
                
            }
        }
        
    }

