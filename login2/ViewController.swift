//
//  ViewController.swift
//  login2
//
//  Created by MAC 11 on 19/04/17.
//  Copyright © 2017 pj. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Verifica que el usuario este logeado
        if let user = FIRAuth.auth()?.currentUser {
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "logeado", sender: self)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Boton de Ingresar
    @IBAction func validar(_ sender: Any) {
        if (txtUsuario.text == "" || txtPass.text == ""){       //Verifica los campos
            let alert1 = UIAlertController(title: "Llene todos los campos",
                                           message: "",
                                           preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Aceptar",
                                             style: .default)
            alert1.addAction(cancelAction)
            present(alert1, animated: true, completion: nil)
            return
        }
        else {      //Iniciar sesion con correo
            if validarCorreoYContrasena() {
                
            FIRAuth.auth()?.signIn(withEmail: self.txtUsuario.text!, password: self.txtPass.text!, completion: { (user, error) in
                if error == nil{
                    // Manda a la siguiente pantalla
                     DispatchQueue.main.async(){
                     self.performSegue(withIdentifier: "logeado", sender: self)
                     }
                }
                else{
                    var mensajes: String
                    if error?.localizedDescription == "The password is invalid or the user does not have a password."{
                        mensajes = "La contraseña es invalida"
                    }
                    else{
                        mensajes = (error?.localizedDescription)!
                    }
                    let alert1 = UIAlertController(title: "Error",
                                                   message: mensajes,
                                                   preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Aceptar",
                                                     style: .default)
                    alert1.addAction(cancelAction)
                    self.present(alert1, animated: true, completion: nil)

                }
            })
            }
            else{
                
                alerta(titulo: "Error", mensaje: "Correo invalido", tituloBoton: "Aceptar")
            }
            
        }
    }
    
    //Boton de Registrarse
    @IBAction func Enviar(_ sender: Any) {
        if (txtUsuario.text == "" || txtPass.text == ""){
            let alert1 = UIAlertController(title: "Llene todos los campos",
                                           message: "",
                                           preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Aceptar",
                                             style: .default)
            alert1.addAction(cancelAction)
            self.present(alert1, animated: true, completion: nil)
            return
        }
        else{
            if validarCorreoYContrasena() {
            FIRAuth.auth()?.createUser(withEmail: self.txtUsuario.text!, password: self.txtPass.text!, completion: { (usuario, error) in
                if error == nil{
                    
                    DispatchQueue.main.async(){
                        self.performSegue(withIdentifier: "logeado", sender: self)
                    }
                }
                else{
                    let alert1 = UIAlertController(title: "Error",
                                                   message: error?.localizedDescription,
                                                   preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Aceptar",
                                                     style: .default)
                    alert1.addAction(cancelAction)
                    self.present(alert1, animated: true, completion: nil)
                }
            })
            }
        }
    }
    func alerta(titulo:String, mensaje:String, tituloBoton: String){
        let alert1 = UIAlertController(title: titulo,
                                       message: mensaje,
                                       preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: tituloBoton,
                                         style: .default)
        alert1.addAction(cancelAction)
        self.present(alert1, animated: true, completion: nil)
    }
    
    func validarCorreoYContrasena() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: txtUsuario.text)
        
    }
}


