//
//  ViewController.swift
//  Fiesta de la media naranja
//
//  Created by g834 DIT UPM on 30/10/18.
//  Copyright © 2018 g834. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myBirthday: Date?
    var myLove: Date?

    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var mediaNaranjaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let bd = myBirthday{
            birthdayLabel.text = "Nací el  \(bd)"
        }else{
            birthdayLabel.text = "No se cuando nací"
        }
        
        if let ld = myLove{
            loveLabel.text = "Me enamoré el \(ld)"
        }else{
            loveLabel.text = "No se cuando me enamoré"
        }
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SelectBirthday"{
           if let bvc = segue.destination as? CumpleViewController {
                
                if let b = myBirthday {
                bvc.birthday = b
                }
            }
        }else if segue.identifier == "SelectLove"{
            if let lvc = segue.destination as? LoveViewController {
                if let l = myLove {
                    lvc.love = l
                    
                }
            }
        }
        
    }
    // Actualiza Birthday Label
    
    func updateBL(){
        if let bd = myBirthday{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "es_ES")
            let t = dateFormatter.string(from: bd)
            birthdayLabel.text = "Nací el \(t)"
        }else{
            birthdayLabel.text = "No se cuando nací"
        }
    }
    
    func updateLL(){
        if let ld = myLove{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "es_ES")
            let t = dateFormatter.string(from: ld)
            loveLabel.text = "Me enamoré el \(t)"
        }else{
            loveLabel.text = "No se cuando me enamoré"
        }
    }


    
    @IBAction func firstPage(_ segue: UIStoryboardSegue){
        
        if segue.identifier == "sb ok"{
            if let bvc = segue.source as? CumpleViewController {
                
                if bvc.birthday > Date() {
                   let alert = UIAlertController(title: "MAL", message: "baja del delorean", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default))
                
                 present(alert, animated: true)
                    
                }else if bvc.birthday > myLove! {
                    let alert = UIAlertController(title: "MAL", message: "baja del delorean", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    
                    present(alert, animated: true)

                }else{
                    
                
                
            myBirthday = bvc.birthday
                updateBL()
                }
            
        }else if segue.identifier == "sb cancel"{
        
        }
        }
    }
    
    @IBAction func secondPage(_ segue: UIStoryboardSegue){
        
        if segue.identifier == "sb ok"{
            if let lvc = segue.source as? LoveViewController {
                
                if lvc.love > Date() {
                    let alert = UIAlertController(title: "MAL", message: "baja del delorean", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default))
                    
                    present(alert, animated: true)
                }else if lvc.love <= myBirthday!{
                    let alerta = UIAlertController(title: "MAL", message: "fecha de enamoramiento erronea", preferredStyle: .alert)
                    alerta.addAction(UIAlertAction(title: "ok", style: .default))
                    present(alerta, animated: true)
                }else{
                
                myLove = lvc.love
                updateLL()
            }
        }else if segue.identifier == "sb cancel"{
            
        }
    }
    }
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


