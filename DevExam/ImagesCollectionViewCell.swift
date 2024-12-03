//
//  ImagesCollectionViewCell.swift
//  DevExam
//
//  Created by Praveen Kumar Murugesan  on 02/12/24.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() { super.awakeFromNib() // Set corner radius for the cell's image view
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        // Optional: Set corner radius for imageView if needed
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
    }
}
