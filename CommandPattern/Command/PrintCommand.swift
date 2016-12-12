//
//  PrintCommand.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class PrintCommand: Command {
    let receiver : Receiver
    let index: Int
    
    init(receiver: Receiver, index: Int) {
        self.receiver = receiver
        self.index = index
    }
    
    func execute() {
        _ = receiver.printItem(index: index)
    }
    
    func  undo() {}
    
    func  redo() {}
}
