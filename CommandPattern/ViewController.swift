//
//  ViewController.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stringInputField: UITextField!
    @IBOutlet weak var indexField: UITextField!
    
    let invoker : Invoker = Invoker()
    let receiver : Receiver = Receiver()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        if let text = stringInputField.text{
            let command = AddCommand(receiver: receiver, operationItem: text)
            invoker.setCommand(command: command)
        }
        print("ADD items:\n " + receiver.stringRepresentation())
        stringInputField.text = ""
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        let command = RemoveCommand(receiver: receiver)
        invoker.setCommand(command: command)
        print("DELETE items after deleting:\n" + receiver.stringRepresentation())
        stringInputField.text = ""
    }
    
    @IBAction func undoButtonAction(_ sender: UIButton) {
        invoker.undo()
        print("UNDO items:\n " + receiver.stringRepresentation())
        stringInputField.text = ""
    }
    
    @IBAction func redoButtonAction(_ sender: UIButton) {
        invoker.redo()
        print("REDO items:\n " + receiver.stringRepresentation())
        stringInputField.text = ""
    }
    
    @IBAction func updateButtonAction(_ sender: UIButton) {
        if let text = stringInputField.text{
            if !text.isEmpty{
                if let indexText = indexField.text{
                    let index = Int(indexText)
                    if index != nil{
                        let command = UpdateCommand(receiver: receiver, index: index!, updateVal: text)
                        invoker.setCommand(command: command)
                        print("UPDATE items:\n " + receiver.stringRepresentation())
                    }
                }
            }
        }
        stringInputField.text = ""
    }
    
    @IBAction func printButtonAction(_ sender: UIButton) {
        if let indexText = indexField.text{
            let index = Int(indexText)
            if index != nil{
                let command = PrintCommand(receiver: receiver, index: index!)
                invoker.setCommand(command: command)
                print("PRINT items:\n " + receiver.stringRepresentation())
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

