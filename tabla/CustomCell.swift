//
//  CustomCell.swift
//  tabla
//
//  Created by rodrigo on 8/29/19.
//  Copyright © 2019 rodrigo. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var telefono: UILabel!
}
