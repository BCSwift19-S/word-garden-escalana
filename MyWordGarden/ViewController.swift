//
//  ViewController.swift
//  MyWordGarden
//
//  Created by Ale Escalante on 1/30/19.
//  Copyright © 2019 Ale Escalante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuessLabel: UILabel!
    
    @IBOutlet weak var GuessLetterField: UITextField!
    @IBOutlet weak var GuessLetterButton: UIButton!
    
    @IBOutlet weak var GuessCountLabel: UILabel!
    @IBOutlet weak var PlayAgainButton: UIButton!
    
    @IBOutlet weak var FlowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In viewDidLoad, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        GuessLetterButton.isEnabled = false
        PlayAgainButton.isHidden = true
    }
    
    func updateUIAfterGuess(){
        GuessLetterField.resignFirstResponder()
        GuessLetterField.text = " "
    }
    
    @IBAction func GuessLetterFieldChange(_ sender: UITextField){
        print("The GuessedLetterField changed!" )
        if let letterGuessed = GuessLetterField.text?.last{
            GuessLetterField.text = String(letterGuessed)
            GuessLetterButton.isEnabled = true
        }else{
            GuessLetterButton.isEnabled = false
        }
    }

    @IBAction func doneKeyPressed(_ sender: UITextField) {
         print("In doneKeyPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        updateUIAfterGuess()
         print("In doneKeyPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
    }
    
    @IBAction func GuessLetterButtonPressed(_ sender: UIButton) {
         print("In GuessLetterButtonPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        updateUIAfterGuess()
        print("In GuessLetterButtonPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        
    }
    
    @IBAction func PlayAgainButtonPressed(_ sender: UIButton) {
    }
    
    
    

}

