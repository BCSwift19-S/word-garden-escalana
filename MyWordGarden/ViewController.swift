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
    var wordToGuess = "SWIFT"
    var lettersGuessed = " "
    let maxNumberWrongGuesses = 8
    var wrongGuessRemaining = 8
    var guessCount = 0
    
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
    func formatUserGuessLabel(){
        var revealedWord = ""
        lettersGuessed += GuessLetterField.text!
        
        for letter in wordToGuess{
            if lettersGuessed.contains(letter){
                revealedWord = revealedWord + String(letter)
            }else{
                revealedWord = revealedWord + "_"
                
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
   
    func GuessALetter(){
        formatUserGuessLabel()
        guessCount += 1
        // changes the flower image depending on the guesses user has made
        let currentLetterGuessed = GuessLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed){
            wrongGuessRemaining = wrongGuessRemaining - 1
            FlowerImageView.image = UIImage(named: "flower" + String(wrongGuessRemaining))
        }
        //stop game is wrongGuessRemaining = 0
        if wrongGuessRemaining == 0{
            PlayAgainButton.isHidden = false
            GuessLetterField.isEnabled = false
            GuessLetterButton.isEnabled = false
        }
//        else if !revealedWord.contains("_")
//        PlayAgainButton.isHidden = false
//        GuessLetterField.isEnabled = false
//        GuessLetterButton.isEnabled = false
//        }else{
//       var guess = "guesses"
////          if guessCount == 1{
////          guess = "guess"
//        //  }
////        GuessCountLabel.text = "You've made String(guessCount) guesses"
////        OR
//        let guess = (guessCount == 1 ? "guess":"guesses")
        
        
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
        GuessALetter()
    }
    
    @IBAction func GuessLetterButtonPressed(_ sender: UIButton) {
         print("In GuessLetterButtonPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        updateUIAfterGuess()
        print("In GuessLetterButtonPressed, is GuessLetterField the first responder", GuessLetterField.isFirstResponder)
        GuessALetter()
        
    }
    
    @IBAction func PlayAgainButtonPressed(_ sender: UIButton) {
        PlayAgainButton.isHidden = true
        GuessLetterField.isEnabled = true
        GuessLetterButton.isEnabled = false
        FlowerImageView.image = UIImage(named: "flower8")
        wrongGuessRemaining = maxNumberWrongGuesses
        lettersGuessed = " "
        formatUserGuessLabel()
        GuessCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
    
    

}

