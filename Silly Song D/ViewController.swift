//
//  ViewController.swift
//  Silly Song D
//
//  Created by Warren Hansen on 11/26/16.
//  Copyright © 2016 Warren Hansen. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: AnyObject) {
        lyricsView.text = ""
        nameField.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: AnyObject) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaBanaTemplate, fullName: nameField.text!)
    }
}

func shortNamefromName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let firstVowelRange = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
        return lowercaseName.substring(from: firstVowelRange.lowerBound)
    } else {
        return lowercaseName
    }
}

let bananaBanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNamefromName(name: fullName)
    let songAndName = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName.capitalized)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return songAndName
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
