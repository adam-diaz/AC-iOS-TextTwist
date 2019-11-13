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
        
    }
    
    func checkUserGuess() {
        let userWord = userInput.text ?? ""
        
        if userWord == scrambleWord.text! {
            view.backgroundColor = .green
        }
}
    
    

    @IBAction func nextWordPressed(_ sender: UIButton) {
       
        scrambleWord.text = brain.getRandomWord().scrambled
        
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
}

