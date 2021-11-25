//
//  ListTableCell.swift
//  IIaBankTest
//
//  Created by Zalak on 25/11/21.
//

import UIKit

class ListTableCell: UITableViewCell {
    
    //MARK: - IBOutlets -
    @IBOutlet private weak var iconImageView    : UIImageView!
    @IBOutlet private weak var nameLabel        : UILabel!
    
    //MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: - SetUP Data
extension ListTableCell {
    
    func setData(_ data: DetailModel) {
        iconImageView.image = data.iconImage
        nameLabel.text      = data.label
    }
}


