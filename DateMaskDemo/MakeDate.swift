//
//  MakeDate.swift
//  DateMaskDemo
//
//  Created by Jenkins_New on 8/2/16.
//  Copyright © 2016 Daffodil. All rights reserved.
//

import UIKit

class MakeDate: NSObject, UITextFieldDelegate {
    
    var textField: UITextField!
    var string: String!
    let characterset = NSCharacterSet(charactersInString: "0123456789")
    
    init?(textField: UITextField!) {
        self.textField = textField
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        self.string = string
        return true
    }
    
    func takeProperDateInput() {
        textField.addTarget(self, action: #selector(textChange(_:)), forControlEvents: .EditingChanged)
    }
    
    @IBAction func textChange(sender: UITextField) {
        print("\(sender.text!)")
        print("\(sender.text!) && \(self.string)")
        
        if self.string == "" {
            if sender.text?.characters.count == 2 {
                let index = sender.text?.endIndex.advancedBy(-2)
                sender.text = sender.text?.substringToIndex(index!)
            }
            else if sender.text?.characters.count == 5 {
                let index = sender.text?.endIndex.advancedBy(-2)
                sender.text = sender.text?.substringToIndex(index!)
            }
        }
        if sender.text?.characters.count == 1 && self.string != "" {
            if self.string.rangeOfCharacterFromSet(characterset.invertedSet) != nil {
                let index = sender.text?.endIndex.advancedBy(-1)
                sender.text = sender.text?.substringToIndex(index!)
            }
            else if Int(sender.text!) != 1 && Int(sender.text!) != 0 {
                sender.text = "0" + sender.text! + "/"
            }
        }
        else if sender.text?.characters.count == 2 && self.string != "" {
            if Int(string) != 1 && Int(string) != 2 && Int(string) != 0{
                let index = sender.text?.endIndex.advancedBy(-1)
                sender.text = sender.text?.substringToIndex(index!)
            }else {
                if Int(sender.text!) != 0 {
                sender.text = sender.text! + "/"
                }else {
                    let index = sender.text?.endIndex.advancedBy(-1)
                    sender.text = sender.text?.substringToIndex(index!)
                }
            }
        }
        else if sender.text?.characters.count == 4 && self.string != "" {
            if self.string.rangeOfCharacterFromSet(characterset.invertedSet) != nil {
                let index = sender.text?.endIndex.advancedBy(-1)
                sender.text = sender.text?.substringToIndex(index!)
            }
        }
        else if sender.text?.characters.count == 5 && self.string != "" {
            if self.string == "/" {
                var yearComponent = sender.text?.componentsSeparatedByString("/")
                let index = sender.text?.endIndex.advancedBy(-2)
                sender.text = sender.text?.substringToIndex(index!)
                sender.text = sender.text! + "0" + yearComponent![1] + "/"
            }else {
                var yearComponent = sender.text?.componentsSeparatedByString("/")
                if Int(yearComponent![1]) > 31 {
                    let index = sender.text?.endIndex.advancedBy(-1)
                    sender.text = sender.text?.substringToIndex(index!)
                }else if Int(yearComponent![1]) > 0 && Int(yearComponent![1]) < 32 {
                    sender.text = sender.text! + "/"
                }else {
                    let index = sender.text?.endIndex.advancedBy(-1)
                    sender.text = sender.text?.substringToIndex(index!)
                }
            }
        }
        else if sender.text?.characters.count == 10 && self.string != "" {
            let index = sender.text?.endIndex.advancedBy(-4)
            if sender.text?.substringFromIndex(index!).rangeOfCharacterFromSet(characterset.invertedSet) != nil {
                let index = sender.text?.endIndex.advancedBy(-4)
                sender.text = sender.text?.substringToIndex(index!)
            } else {
                var yearComponent = sender.text?.componentsSeparatedByString("/")
                if Int(yearComponent![2]) == 0 {
                    let index = sender.text?.endIndex.advancedBy(-4)
                    sender.text = sender.text?.substringToIndex(index!)
                }
            }
        }
        else if sender.text?.characters.count > 10 && self.string != "" {
            let index = sender.text?.endIndex.advancedBy(-1)
            sender.text = sender.text?.substringToIndex(index!)
        }
    }
}
    
    
