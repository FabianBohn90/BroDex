//
//  ItemDetailVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 23.01.23.
//

import UIKit

class ItemDetailVC: UIViewController {
    
    var itemData: Item? = nil
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var categorieLabel: UILabel!
    
    @IBOutlet weak var attributeOneLabel: UILabel!
    @IBOutlet weak var attributeTwoLabel: UILabel!
    @IBOutlet weak var attributeThreeLabel: UILabel!
    @IBOutlet weak var attributeFourLabel: UILabel!
    @IBOutlet weak var attributeFiveLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var flingPowerLabel: UILabel!
    @IBOutlet weak var flingEffectLabel: UILabel!
    
    
    @IBOutlet weak var flavorTextLabel: UILabel!
    @IBOutlet weak var effectLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlData = itemData?.sprites.default
        itemImageView.sd_setImage(with: URL(string: urlData ?? "https://i.ibb.co/W2bWG2Q/missingno.png"), placeholderImage: UIImage(named: "splash screen"))
        
        if (self.itemData?.names.count)! > 4{
            itemNameLabel.text = itemData?.names[4].name
        } else {
            itemNameLabel.text = itemData?.name
        }
        
        categorieLabel.text = itemData?.category.name
        
        switch itemData?.attributes.count {
        case 0 : print("No Attributes")
            
        case 1 : attributeOneLabel.text = itemData?.attributes[0].name
                
        case 2 : attributeOneLabel.text = itemData?.attributes[0].name
                 attributeTwoLabel.text = itemData?.attributes[1].name
            
        case 3 : attributeOneLabel.text = itemData?.attributes[0].name
                 attributeTwoLabel.text = itemData?.attributes[1].name
                 attributeThreeLabel.text = itemData?.attributes[2].name
        
        case 4 : attributeOneLabel.text = itemData?.attributes[0].name
                 attributeTwoLabel.text = itemData?.attributes[1].name
                 attributeThreeLabel.text = itemData?.attributes[2].name
                 attributeFourLabel.text = itemData?.attributes[3].name
            
        case 5 : attributeOneLabel.text = itemData?.attributes[0].name
                 attributeTwoLabel.text = itemData?.attributes[1].name
                 attributeThreeLabel.text = itemData?.attributes[2].name
                 attributeFourLabel.text = itemData?.attributes[3].name
                 attributeFiveLabel.text = itemData?.attributes[4].name
    
        case .none:
            print("No Attributes")
        case .some(_):
            print("No Attributes")
        }
        
        costLabel.text = "\(itemData?.cost ?? 0) Pokédollar"
        
        flingPowerLabel.text = "\(itemData?.fling_power ?? 0)"
        flingEffectLabel.text = itemData?.fling_effect ?? "-"
        
        
        var indexFlavorTxt = 0
        
        for i in 0..<(itemData?.flavor_text_entries.count ?? 0) {
            if itemData?.flavor_text_entries[i].language.name == "de"{
                indexFlavorTxt = i
            }
        }
        
        flavorTextLabel.text = itemData?.flavor_text_entries[indexFlavorTxt].text
        effectLabel.text = itemData?.effect_entries[0].effect
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
