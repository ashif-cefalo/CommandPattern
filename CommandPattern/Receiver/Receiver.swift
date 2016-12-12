//
//  Receiver.swift
//  CommandPattern
//
//  Created by Ashif Iqbal on 10/12/16.
//  Copyright © 2016 cefalo. All rights reserved.
//

import UIKit

class Receiver {
    
    var stringList : [String] = [String]()
    
    func add(item: String){
        stringList.append(item)
    }
    
    func update(index: Int, item: String){
        if stringList.count > index{
            stringList[index] = item
        }
        else{
            print("update: invalid index \(index)")
        }
    }
    
    func removeItem() -> String?{
        if stringList.count > 0{
            return stringList.remove(at: stringList.count - 1)
        }
        else{
            print("delete: invalid index \(index)")
            return nil
        }
        
    }
    
    func printItem(index: Int)-> String?{
        if stringList.count > index{
            print("Printing at index: \(index) value: " + stringList[index]);
            return stringList[index]
        }
        else{
            print("Print: invalid index \(index)");
            return nil
        }
    }
    
    func stringRepresentation() -> String{
        var string = ""
        for str in stringList{
            string += "\(str)\n"
        }
        return string
    }
}
