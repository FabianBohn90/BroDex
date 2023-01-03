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

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
    }
    

    @IBOutlet weak var pokeIV: UIImageView!
    @IBOutlet weak var pokeLB: UILabel!


}
