//
//  DeleteCommand.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class RemoveCommand: Command {

    let receiver : Receiver
    var itemToDelete: String?
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    func execute() {
        if let deletedItem = receiver.removeItem(){
            itemToDelete = deletedItem
        }
    }
    
    func  undo() {
        if (itemToDelete != nil){
            receiver.add(item: itemToDelete!)
        }
    }
    
    func  redo() {
        if let deletedItem = receiver.removeItem(){
            itemToDelete = deletedItem
        }
    }
}
