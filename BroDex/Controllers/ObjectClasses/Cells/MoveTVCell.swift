//
//  MoveTVCell.swift
//  BroDex
//
//  Created by Fabian Bohn on 24.01.23.
//

import UIKit

class MoveTVCell: UITableViewCell {
    
    
    @IBOutlet weak var moveNameLabel: UILabel!
    @IBOutlet weak var moveTypeLabel: RoundedCornersLabel!
    @IBOutlet weak var moveDmgClassLabel: RoundedCornersLabel!
    
    @IBOutlet weak var movePrioLabel: UILabel!
    @IBOutlet weak var movePowerLabel: UILabel!
    @IBOutlet weak var moveGenLabel: UILabel!
    @IBOutlet weak var moveApLabel: UILabel!
    
    @IBOutlet weak var moveTargetLabel: UILabel!
    @IBOutlet weak var moveTmLabel: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    
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
    
    
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}
