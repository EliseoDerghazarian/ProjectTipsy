//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Eliseo Derghazarian on 03/06/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var billValue: String?
    var numberOfPeople: Int?
    var tip: Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billValue
        
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tip!) tip."

    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //Go back to the previous screen
        self.dismiss(animated: true, completion: nil)
    }
    

    

}
