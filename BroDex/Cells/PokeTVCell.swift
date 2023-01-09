//
//  PokeTVCell.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class PokeTVCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Set the layout margins of the cell
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(
                top: 6,
                left: 6,
                bottom: 6,
                right: 6
            )
        )
        
    }
    

    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var pokeNameLB: UILabel!
    @IBOutlet weak var pokeNumberLB: UILabel!
    @IBOutlet weak var pokeType1LB: UILabel!
    @IBOutlet weak var pokeType2LB: UILabel!
    
    
}
