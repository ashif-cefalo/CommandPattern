//
//  Command.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import Foundation

protocol Command {
    func execute()
    func undo()
    func redo()
}
