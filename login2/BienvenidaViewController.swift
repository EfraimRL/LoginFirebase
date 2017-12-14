//
//  BienvenidaViewController.swift
//  login2
//
//  Created by MAC 11 on 27/04/17.
//  Copyright © 2017 pj. All rights reserved.
//

import UIKit
import Firebase

class BienvenidaViewController: UIViewController {
    @IBOutlet weak var lblBienvenida: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Valida que este logeado SINO manda a ventana de logeo/Registro
        if let user = FIRAuth.auth()?.currentUser {
            lblBienvenida.text = user.email!
        }
        else{
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "logearse", sender: self)
            }
        }
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Logout(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        DispatchQueue.main.async(){
            self.performSegue(withIdentifier: "logearse", sender: self)
        }
        
    }
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
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
