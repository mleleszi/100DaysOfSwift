//
//  Person.swift
//  Project10
//
//  Created by Marcell Leleszi on 2022. 05. 24..
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
