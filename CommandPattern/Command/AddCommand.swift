//
//  AddCommand.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class AddCommand: Command {
    
    let receiver : Receiver
    let item: String
    
    init(receiver: Receiver, operationItem: String) {
        self.receiver = receiver
        self.item = operationItem
    }
    
    func execute() {
        receiver.add(item: item)
    }
    
    func  undo() {
        _ = receiver.removeItem()
    }
    
    func  redo() {
        receiver.add(item: item)
    }
}
