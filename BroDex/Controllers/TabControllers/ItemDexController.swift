//
//  ItemDexController.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class ItemDexController: UIViewController {
    
    let url = "https://pokeapi.co/api/v2/item?limit=1609"
    var data: Response?
    var itemData: Item?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
        
        
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
    
    @objc func hideKeyboard() {
        view.endEditing(true)
        
    }
}




extension ItemDexController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
//    private func createSpinenrFooter() -> UIView {
//        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size .width, height: 100))
//
//        let spinner = UIActivityIndicatorView()
//        spinner.center = footerView.center
//        footerView.addSubview(spinner)
//        spinner.startAnimating()
//        return footerView
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        if position > (tableView.contentSize.height-100-scrollView.frame.size.height) {
//            guard !isPaginating else {
//                return
//            }
//            self.tableView.tableFooterView = createSpinenrFooter()
//
//            // Fetch the next page of data and reload the table view.
//            fetchData(paginating: true, URL: data?.next ?? "Error"){ [weak self] result in
//                DispatchQueue.main.async {
//                    self?.tableView.tableFooterView = nil
//                }
//                switch result{
//                case .success(let data):
//                    self?.data?.results.append(contentsOf: data.results)
//                    self?.data?.next = data.next
//                    DispatchQueue.main.async {
//                        self?.tableView.reloadData()
//
//                    }
//                case .failure(_):
//                    break
//                }
//            }
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemTVCell else {
            fatalError("Unexpected cell class dequeued")
        }
        fetchItem(URL: (data?.results[indexPath.row].url)!) {result in
            self.itemData = result
            
            DispatchQueue.main.async {
                if (self.itemData?.names.count)! >= 4{
                    
                    cell.itemLB.text = self.itemData?.names[4].name
                }else {
                    cell.itemLB.text = self.itemData?.name
                }
                
                let urlData = self.itemData?.sprites.default
                
                cell.itemIV.sd_setImage(with: URL(string: urlData ?? "error"), placeholderImage: UIImage(named: "splash screen"))
            }
        }
        return cell
    }
}
