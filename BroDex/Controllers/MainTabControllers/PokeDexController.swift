//
//  ViewController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit
import Kingfisher


class PokeDexController: UIViewController, UISearchBarDelegate {
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=1008"
    var data: Response?
    var germanData: Response?
    var pokeData: Pokemon?
    var filteredData: [Results]?
    var isSearching = false
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        pokeSearchBar.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        tap.cancelsTouchesInView = false

        
        fetchData(URL: url) {result in
            
            switch result{
            case .success(let data):
                 self.data = data
                DispatchQueue.main.async {
                    self.germanData = self.data
                    for i in 0..<(self.data?.results.count)! {
                        self.germanData?.results[i].name = translatePokemonName(englishName: (self.data?.results[i].name)!)
                    }
                    self.tableView.reloadData()
        }
                
            case .failure(_):
                break
            }
        }
    
        
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
        
    }

    
    //MARK: SearchBar Setup
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        
        filteredData = germanData?.results.filter { $0.name.range(of: searchText, options: .caseInsensitive) != nil  }
        isSearching = true
           tableView.reloadData()
        
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        }
    }
}

//MARK: TabelView Setup

extension PokeDexController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == false{
            return germanData?.results.count ?? 0
        } else {
            return filteredData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as? PokeTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        cell.addBtn.tag = indexPath.row
        cell.addBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
        var urlData = (germanData?.results[indexPath.row].url)!
        var pokeNameData = (germanData?.results[indexPath.row].name)!
        
        if self.isSearching == true {
            urlData = (filteredData?[indexPath.row].url)!
            pokeNameData = (filteredData?[indexPath.row].name)!
        }
        
        cell.imgBgView.layer.cornerRadius = 8
        cell.imgBgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        cell.imgBgView.layer.masksToBounds = true
        
        cell.pokeNameLB.text = pokeNameData
        
        fetchPokemon(URL: urlData) {result in
            self.pokeData = result
            
            DispatchQueue.main.async {
                let urlData = URL(string: self.pokeData?.sprites.other.propertyWithHyphen.front_default ?? "https://i.ibb.co/W2bWG2Q/missingno.png")

                let processor = DownsamplingImageProcessor(size: cell.pokeIV.bounds.size)

                cell.pokeIV.kf.indicatorType = .activity
                cell.pokeIV.kf.setImage(
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
                
                cell.pokeNumberLB.text = "#\(self.pokeData?.id ?? 0)"
                
                if self.pokeData?.types.count == 1 {
                    
                    cell.pokeType1LB.text =  translateTypeName(
                        englishName: self.pokeData?.types[0].type.name ?? "error")
                    cell.pokeType2LB.isHidden = true
                    
                }
                
                if self.pokeData?.types.count == 2 && self.pokeData?.types[1].type.name != nil  {
                    cell.pokeType1LB.text = translateTypeName(
                        englishName: self.pokeData?.types[0].type.name ?? "error")
                    cell.pokeType2LB.isHidden = false
                    cell.pokeType2LB.text = translateTypeName(
                        englishName: self.pokeData?.types[1].type.name ?? "error")
                }
                
                if self.pokeData?.types.count == 0 {print("Error no types Found")}
                
                let pokeType = self.pokeData?.types[0].type.name
                
                switch pokeType{
                case "fire":      cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.816, green: 0.255, blue: 0.153, alpha: 1.0)
                case "grass":     cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.376, green: 0.694, blue: 0.22, alpha: 1.0)
                case "water":     cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.125, green: 0.51, blue: 0.898, alpha: 1.0)
                case "steel":     cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.525, green: 0.522, blue: 0.667, alpha: 1.0)
                case "bug":       cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.616, green: 0.663, blue: 0.078, alpha: 1.0)
                case "flying":    cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.439, green: 0.518, blue: 0.855, alpha: 1.0)
                case "normal":    cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.545, green: 0.478, blue: 0.373, alpha: 1.0)
                case "poison":    cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.569, green: 0.231, blue: 0.51, alpha: 1.0)
                case "electric":  cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.867, green: 0.643, blue: 0.047, alpha: 1.0)
                case "ground":    cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.694, green: 0.557, blue: 0.157, alpha: 1.0)
                case "fairy":     cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.839, green: 0.529, blue: 0.839, alpha: 1.0)
                case "fighting":  cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.498, green: 0.2, blue: 0.11, alpha: 1.0)
                case "psychic":   cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.812, green: 0.247, blue: 0.447, alpha: 1.0)
                case "rock":      cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.627, green: 0.525, blue: 0.192, alpha: 1.0)
                case "ghost":     cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.247, green: 0.247, blue: 0.584, alpha: 1.0)
                case "ice":       cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.129, green: 0.659, blue: 0.776, alpha: 1.0)
                case "dragon":    cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.388, green: 0.278, blue: 0.824, alpha: 1.0)
                case "dark":      cell.backGroundView.layer.backgroundColor = #colorLiteral(red: 0.325, green: 0.247, blue: 0.204, alpha: 1.0)
                    
                case .none:
                    cell.contentView.layer.backgroundColor = CGColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.6)
                case .some(_):
                    cell.contentView.layer.backgroundColor = CGColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.6)
                }
            }
        }
        
        if self.traitCollection.userInterfaceStyle == .dark {
            cell.backGroundView.dropShadow(color: .white, opacity: 0.50, offSet: CGSize(width: 1, height: 1), radius: 3, scale: true)
            cell.imgBgView.layer.borderWidth = 1
            cell.imgBgView.layer.borderColor = UIColor.white.cgColor
            
        } else {
          cell.backGroundView.dropShadow(color: .black, opacity: 0.50, offSet: CGSize(width: 1, height: 1), radius: 3, scale: true)
            cell.imgBgView.layer.borderWidth = 1
            cell.imgBgView.layer.borderColor = UIColor.black.cgColor
        }

        
//        cell.backGroundView.dropShadow(color: .white, opacity: 0.50, offSet: CGSize(width: 1, height: 1), radius: 3, scale: true)
        
        return cell
    }
    
    @objc func buttonTapped(sender: UIButton) {
      let buttonRow = sender.tag
        let newPokemon = PokemonDB(context: self.context)
        newPokemon.name = (germanData?.results[buttonRow].name)!
        newPokemon.url = (germanData?.results[buttonRow].url)!
        
        do {
           try self.context.save()
        } catch {
            print("Save Failed")
        }
    }
    
    // MARK: - Navigation
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        var pokemon = germanData?.results[indexPath.row]
        if isSearching == true { pokemon = filteredData?[indexPath.row] }
        
        DataManager.shared.pokemon = pokemon
        
        performSegue(withIdentifier: "toPokemonDetail", sender: pokemon)
        
        return indexPath
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toPokemonDetail" {
                
                guard let destinationVC = segue.destination as? TabBarController else { return }
                guard let PokemonTuple = sender as? (Results) else  { return }
                
                destinationVC.pokemon = PokemonTuple
                
            }
        }
    }

