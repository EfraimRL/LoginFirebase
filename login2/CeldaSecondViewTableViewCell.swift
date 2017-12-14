//
//  CeldaSecondViewTableViewCell.swift
//  listaFerb
//
//  Created by MAC 10 on 02/06/17.
//  Copyright © 2017 eva. All rights reserved.
//

import UIKit

class CeldaSecondViewTableViewCell: UITableViewCell {

    @IBOutlet weak var txtNombre: UILabel!
    var id_spoas = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var txtLabbel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
