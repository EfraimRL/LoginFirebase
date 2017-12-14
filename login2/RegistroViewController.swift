//
//  RegistroViewController.swift
//  login2
//
//  Created by MAC 11 on 20/04/17.
//  Copyright © 2017 pj. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtRepPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func validaciones(_ sender: Any) {
        if (txtUsuario.text == "" || txtPass.text == "" || txtRepPass.text == ""){
            return
        }
        if (txtPass.text != txtRepPass.text){
            let alert1 = UIAlertController(title: "Error",
                                          message: "Las contraseñas deben coincidir",
                                          preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar",
                                             style: .default)
            alert1.addAction(cancelAction)
            present(alert1, animated: true, completion: nil)
            //return
        }
        else {
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "push", sender: self)
            }
        }
    }

    @IBOutlet weak var salida: UITextField!
    @IBOutlet weak var salida2: UITextField!
    @IBAction func SignUp(_ sender: UIButton) {
        let alert = UIAlertController(title: "Nuevo Usuario",
                                      message: "Introduce tus datos por favor",
                                      preferredStyle: .alert)
        //2.
        let saveAction = UIAlertAction(title: "Guardar",
                                       style: .default) { action in
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        //3.
                                        self.salida.text = emailField.text!
                                        self.salida2.text = passwordField.text!
        }
        //4.
        let cancelAction = UIAlertAction(title: "Cancelar",
                                         style: .default)
        //5.
        alert.addTextField { textEmail in
            textEmail.placeholder = "email"
        }
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "contraseña"
        }
        //6.
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        //7.
        present(alert, animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
