//
//  DetallesDeViajeTableViewCell.swift
//  listaFerb
//
//  Created by MAC 10 on 01/06/17.
//  Copyright © 2017 eva. All rights reserved.
//

import UIKit

class DetallesDeViajeTableViewCell: UITableViewCell {

    @IBOutlet weak var txtTitulo: UITextView!
    @IBOutlet weak var txtDescripcion: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
