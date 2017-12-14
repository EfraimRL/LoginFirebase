//
//  DetallesDeViajeTableViewController.swift
//  listaFerb
//
//  Created by MAC 10 on 01/06/17.
//  Copyright © 2017 eva. All rights reserved.
//

import UIKit

class DetallesDeViajeTableViewController: UITableViewController {

    var array = [[String:String]]()
    var columnas = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nom = "Nombre"
        let des = "Descripcion"
        let ori = "Origen"
        let destino = "Destino"
        let enc = "Encargado"
        let cod = "Codigo_Postal"
        let tel = "Telefono"
        let cor = "Correo"
        columnas = [nom,des,ori,destino,enc,cod,tel,cor]
        
        DataBase.checkAndCreateDatabase()
        array = DataBase().ejecutarSelect("SELECT * FROM Rutas where idRutas = 1") as! [[String:String]]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        print(array)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return columnas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath) as! DetallesDeViajeTableViewCell
        
        let titulo = columnas[indexPath.row]
        let descripcion = array[0][columnas[indexPath.row]]
        print(titulo)
        print(description)
        cell.txtTitulo.text = titulo
        cell.txtDescripcion.text = descripcion
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
