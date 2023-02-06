//
//  ItemDetailVC.swift
//  BroDex
//
//  Created by Fabian Bohn on 23.01.23.
//

import UIKit
import Kingfisher

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
        
        
        
        let urlData = URL(string:itemData?.sprites.default ?? "https://i.ibb.co/W2bWG2Q/missingno.png")
        let processor = DownsamplingImageProcessor(size: itemImageView.bounds.size)
        itemImageView.kf.setImage(
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
        
        if (self.itemData?.names.count)! > 4{
            itemNameLabel.text = itemData?.names[4].name
        } else {
            itemNameLabel.text = itemData?.name
        }
        
        categorieLabel.text = translateItemCategoryName(englishName:itemData?.category.name ?? "-")
        
        switch itemData?.attributes.count {
        case 0 : print("No Attributes")
            
        case 1 : attributeOneLabel.text = translateItemAttributeName(englishName: itemData?.attributes[0].name ?? "-")
                
        case 2 : attributeOneLabel.text = translateItemAttributeName(englishName:itemData?.attributes[0].name ?? "-")
            attributeTwoLabel.text = translateItemAttributeName(englishName:itemData?.attributes[1].name ?? "-")
            
        case 3 : attributeOneLabel.text = translateItemAttributeName(englishName:itemData?.attributes[0].name ?? "-")
            attributeTwoLabel.text = translateItemAttributeName(englishName:itemData?.attributes[1].name ?? "-")
            attributeThreeLabel.text = translateItemAttributeName(englishName:itemData?.attributes[2].name ?? "-")
        
        case 4 : attributeOneLabel.text = translateItemAttributeName(englishName:itemData?.attributes[0].name ?? "-")
            attributeTwoLabel.text = translateItemAttributeName(englishName: itemData?.attributes[1].name ?? "-")
            attributeThreeLabel.text = translateItemAttributeName(englishName:itemData?.attributes[2].name ?? "-")
            attributeFourLabel.text = translateItemAttributeName(englishName: itemData?.attributes[3].name ?? "-")
            
        case 5 : attributeOneLabel.text = translateItemAttributeName(englishName: itemData?.attributes[0].name ?? "-")
            attributeTwoLabel.text = translateItemAttributeName(englishName: itemData?.attributes[1].name ?? "-")
            attributeThreeLabel.text = translateItemAttributeName(englishName: itemData?.attributes[2].name ?? "-")
            attributeFourLabel.text = translateItemAttributeName(englishName: itemData?.attributes[3].name ?? "-")
            attributeFiveLabel.text = translateItemAttributeName(englishName: itemData?.attributes[4].name ?? "-")
    
        case .none:
            print("No Attributes")
        case .some(_):
            print("No Attributes")
        }
        
        costLabel.text = "\(itemData?.cost ?? 0) Pokédollar"
        
        flingPowerLabel.text = "\(itemData?.fling_power ?? 0)"
        flingEffectLabel.text = translateFlingEffectName(englishName: itemData?.fling_effect?.name ?? "-")
        
        
        var indexFlavorTxt = 0
        
        for i in 0..<(itemData?.flavor_text_entries.count ?? 0) {
            if itemData?.flavor_text_entries[i].language?.name == "de"{
                indexFlavorTxt = i
            }
        }
        
        flavorTextLabel.text = itemData?.flavor_text_entries[indexFlavorTxt].text
        
        
        if itemData?.effect_entries.count == 0 {
            effectLabel.text = "-"
        }else {
            effectLabel.text = itemData?.effect_entries[0].effect
        }
    }
}
