//
//  CumpleViewController.swift
//  Fiesta de la media naranja
//
//  Created by g834 DIT UPM on 30/10/18.
//  Copyright © 2018 g834. All rights reserved.
//

import UIKit

class CumpleViewController: UIViewController {
    
    var birthday = Date()

    @IBOutlet weak var birthdayPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        birthdayPicker.date = birthday
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sb ok" {
            birthday = birthdayPicker.date
        }else if segue.identifier == "sb cancel"{
            
    }
}
}
