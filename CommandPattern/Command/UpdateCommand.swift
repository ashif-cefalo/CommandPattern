//
//  UpdateCommand.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class UpdateCommand: Command {
    
    let receiver : Receiver
    let newValue : String
    let index : Int
    var oldValue : String?
    
    init(receiver: Receiver, index: Int, updateVal: String) {
        self.receiver = receiver
        self.index = index
        self.newValue = updateVal
    }
    
    func execute() {
        oldValue = receiver.printItem(index: index)
        receiver.update(index: index, item: newValue)
    }
    
    func  undo() {
        if (oldValue != nil){
            receiver.update(index: index, item: oldValue!)
        }
    }
    
    func  redo() {
        _ = execute()
    }
}
