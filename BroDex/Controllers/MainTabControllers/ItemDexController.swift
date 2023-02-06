//
//  ItemDexController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit
import Kingfisher

class ItemDexController: UIViewController, UISearchBarDelegate {
    
    let url = "https://pokeapi.co/api/v2/item?limit=2050"
    var data: Response?
    var germanData: Response?
    var itemData: Item?
    var filteredData: [Results]?
    var isSearching = false

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var itemSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        itemSearchBar.delegate = self
        
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
                            let urlData = data.results[i].url

                            fetchItem(URL: urlData) {result in
                                self.itemData = result

                                    if (self.itemData?.names.count)! > 4{
                                        self.germanData?.results[i].name = (self.itemData?.names[4].name)!
                                    }else {
                                        self.germanData?.results[i].name = self.itemData!.name
                                    }

                                }
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




extension ItemDexController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching == false{
            return germanData?.results.count ?? 0
        } else {
            return filteredData?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        
        var urlData = (germanData?.results[indexPath.row].url)!
        var itemNameData = (germanData?.results[indexPath.row].name)!
        
        if self.isSearching == true {
            urlData = (filteredData?[indexPath.row].url)!
            itemNameData = (filteredData?[indexPath.row].name)!
        }
        
        cell.itemLB.text = itemNameData
        
        fetchItem(URL: urlData) {result in
            self.itemData = result

            DispatchQueue.main.async {
                let urlData = URL(string:self.itemData?.sprites.default ?? "https://i.ibb.co/W2bWG2Q/missingno.png")
                let processor = DownsamplingImageProcessor(size: cell.itemIV.bounds.size)
                cell.itemIV.kf.setImage(
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
            }
        }
        return cell
    }
    
    // MARK: - Navigation
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        var urlData = germanData?.results[indexPath.row].url
        if isSearching == true { urlData = filteredData?[indexPath.row].url }
        
        fetchItem(URL: urlData!) {result in
            self.itemData = result
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toItemDetail", sender: self.itemData)
                
            }
        }
        
        
        
        
//        performSegue(withIdentifier: "toItemDetail", sender: itemData)
        
        return indexPath
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toItemDetail" {
                
                guard let destinationVC = segue.destination as? ItemDetailVC else { return }
                guard let itemData = sender as? ( Item ) else  { return }
                
                destinationVC.itemData = itemData
                
            }
        }
}


