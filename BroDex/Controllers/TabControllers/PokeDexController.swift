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
        
        cell.pokeNameLB.text = translatePokemonName(englishName: (data?.results[indexPath.row].name)!)
        
        
        fetchPokemon(URL: (data?.results[indexPath.row].url)!) {result in
            self.pokeData = result
            
            DispatchQueue.main.async {
                let urlData = self.pokeData?.sprites.other.propertyWithHyphen.front_default
                cell.pokeIV.sd_setImage(with: URL(string: urlData!), placeholderImage: UIImage(named: "splash screen"))
                
                cell.pokeNumberLB.text = "#\(self.pokeData?.id ?? 0)"
                
                if self.pokeData?.types.count == 1 {
                    
                    cell.pokeType1LB.text =  translateTypeName(
                        englishName: self.pokeData?.types[0].type.name ?? "error")
                    cell.pokeType2LB.isHidden = true
                    
                }else {
                    cell.pokeType1LB.text = translateTypeName(
                        englishName: self.pokeData?.types[0].type.name ?? "error")
                    cell.pokeType2LB.text = translateTypeName(
                        englishName: self.pokeData?.types[1].type.name ?? "error")
                    
                }
                
                let pokeType = self.pokeData?.types[0].type.name
                
                switch pokeType{
                case "fire":     cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.816, green: 0.255, blue: 0.153, alpha: 1.0)
                case "grass":    cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.376, green: 0.694, blue: 0.22, alpha: 1.0)
                case "water":    cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.125, green: 0.51, blue: 0.898, alpha: 1.0)
                case "steel":    cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.525, green: 0.522, blue: 0.667, alpha: 1.0)
                case "bug":      cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.616, green: 0.663, blue: 0.078, alpha: 1.0)
                case "flying":   cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.439, green: 0.518, blue: 0.855, alpha: 1.0)
                case "normal":   cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.545, green: 0.478, blue: 0.373, alpha: 1.0)
                case "poison":   cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.569, green: 0.231, blue: 0.51, alpha: 1.0)
                case "electric": cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.867, green: 0.643, blue: 0.047, alpha: 1.0)
                case "ground":   cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.694, green: 0.557, blue: 0.157, alpha: 1.0)
                case "fairy":    cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.839, green: 0.529, blue: 0.839, alpha: 1.0)
                case "fighting": cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.498, green: 0.2, blue: 0.11, alpha: 1.0)
                case "psychic":  cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.812, green: 0.247, blue: 0.447, alpha: 1.0)
                case "rock":     cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.627, green: 0.525, blue: 0.192, alpha: 1.0)
                case "ghost":    cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.247, green: 0.247, blue: 0.584, alpha: 1.0)
                case "ice":      cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.129, green: 0.659, blue: 0.776, alpha: 1.0)
                case "dragon":   cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.388, green: 0.278, blue: 0.824, alpha: 1.0)
                case "dark":     cell.contentView.layer.backgroundColor = #colorLiteral(red: 0.325, green: 0.247, blue: 0.204, alpha: 1.0)
                    
                case .none:
                    cell.contentView.layer.backgroundColor = CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.6)
                case .some(_):
                    cell.contentView.layer.backgroundColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.6)
                }
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

