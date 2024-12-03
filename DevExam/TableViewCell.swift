//
//  TableViewCell.swift
//  DevExam
//
//  Created by Praveen Kumar Murugesan  on 02/12/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellSubTitle: UILabel!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImage.layer.cornerRadius = 10
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
