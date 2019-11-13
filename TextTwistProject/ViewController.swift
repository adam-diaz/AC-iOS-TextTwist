//
//  ViewController.swift
//  TextTwistProject
//
//  Created by Benjamin Stone on 11/4/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var scrambleWord: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var nextWord: UIButton!
    
    var brain = Word.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        scrambleWord.text = brain.getRandomWord().scrambled
        nextWord.isHidden = true
    }
    
    func checkUserGuess() {
        let userWord = userInput.text ?? ""
        if userWord.sorted() == scrambleWord.text!.sorted() {
            print("correct")
            view.backgroundColor = .green
            nextWord.isHidden = false
        } else {
            view.backgroundColor = .red
        }
    }
    
    

    
    
    
    @IBAction func userInputPressed(_ sender: UITextField) {
        checkUserGuess()
       
        }
    
    
    @IBAction func nextWordPressed(_ sender: UIButton) {
        
        nextWord.isHidden = true
        scrambleWord.text = brain.getRandomWord().scrambled
        view.backgroundColor = .white
        
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // to dismiss ketboard
        textField.resignFirstResponder()
        checkUserGuess()
        textField.text = nil
        return true
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
            if let oldString = textField.text {
            let newString = oldString.replacingCharacters(in: Range(range, in: oldString)!,with: "")
            // ...
        }
        return true
    }
}

