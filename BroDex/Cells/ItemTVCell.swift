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
        // Set the separator inset to be 10 points on the left and right side of the cell
            separatorInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
            // Set the layout margins to be 10 points on the left and right side of the cell
            layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)

    }
    
    @IBOutlet weak var itemIV: UIImageView!
    @IBOutlet weak var itemLB: UILabel!


}
