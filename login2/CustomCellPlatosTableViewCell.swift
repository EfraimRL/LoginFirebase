//
//  CustomCellPlatosTableViewCell.swift
//  listaFerb
//
//  Created by MAC 10 on 29/05/17.
//  Copyright © 2017 eva. All rights reserved.
//

import UIKit

class CustomCellPlatosTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenDeCelda: UIImageView!
    @IBOutlet weak var txtCelda1: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
