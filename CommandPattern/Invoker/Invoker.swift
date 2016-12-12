//
//  Invoker.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class Invoker {
    var commandsList : [Command] = [Command]()
    var undoCommandsList : [Command] = [Command]()
    var shouldRedo : Bool = false
    
    func setCommand(command: Command){
        resetCommands()
        commandsList.append(command)
        command.execute()
    }
    
    func undo(){
        if commandsList.count > 0{
            print("")
            let command = commandsList.remove(at: commandsList.count - 1)
            undoCommandsList.append(command)
            command.undo()
        }
        else{
            print("no command to undo")
        }
    }
    
    func redo(){
        if undoCommandsList.count > 0 {
            shouldRedo = true
            let command = undoCommandsList.remove(at: undoCommandsList.count - 1)
            commandsList.append(command)
            command.redo()
        }
        else {
            print("no command to redo")
        }
    }
    
    func resetCommands(){
        if (shouldRedo == true) {
            undoCommandsList.removeAll()
            undoCommandsList = [Command]()
            shouldRedo = false
        }
    }
}
