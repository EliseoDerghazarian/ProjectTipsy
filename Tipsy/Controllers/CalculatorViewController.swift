//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
//  Modified by Eliseo Derghazarian 03/06/2021.

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var billValue = "0.0"
    
    

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
        
        //Seleccion de botones
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //Obtenemos el valor del stepper con sender.value, parseamos el numero a String y se lo asignamos al texto del splitNumberLabel
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
        
        
        }
    

    @IBAction func calculatedPressed(_ sender: UIButton) {
            
        //Obtenemos el texto que el usuario ingresó en billTextField
        let bill = billTextField.text!
        let billAsNumber = round(Double(bill)!)
        billTotal = ((billAsNumber * tip) + billAsNumber) / Double(numberOfPeople)
        
        billValue = String(format: "%.2f", billTotal)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billValue = billValue
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tip = tip
            
        }
    }
}


