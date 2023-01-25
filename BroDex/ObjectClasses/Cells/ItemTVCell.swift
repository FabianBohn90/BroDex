//
//  ItemTVCell.swift
//  BroDex
//
//  Created by Fabian Bohn on 02.01.23.
//

import UIKit

class ItemTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
            // Set the separator inset of the cell
            separatorInset = UIEdgeInsets(
                top: 20,
                left: 10,
                bottom: 20,
                right: 10
            )
        
            // Set the layout margins of the cell
            layoutMargins = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
        
    }
    
    @IBOutlet weak var itemIV: UIImageView!
    @IBOutlet weak var itemLB: UILabel!

}
