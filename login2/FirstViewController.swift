//
//  FirstViewController.swift
//  listaFerb
//
//  Created by MAC 10 on 29/05/17.
//  Copyright © 2017 eva. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var arrayCategoria = [[String:String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let c1 = ["idc":"1","nomc":"uno"]
        let c2 = ["idc":"2","nomc":"dos"]
        let c3 = ["idc":"3","nomc":"tres"]
        // Do any additional setup after loading the view, typically from a nib.
        arrayCategoria = [c1,c2,c3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategoria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaTableViewCell
        
        let nombreCategoria = arrayCategoria[indexPath.row]["nomc"]
        
        celda.txtLabel.text = nombreCategoria
        
        return celda
    }
}

