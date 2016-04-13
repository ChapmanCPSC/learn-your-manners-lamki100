//
//  Drinking.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct Drinking : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Drinking"
        self.image = "drinking.jpg"
        self.description = "Table manners for drinking beverages. Beverages drunk at the table and at parties have a set of manners all their own, and some guidelines apply across the board:\n-Take a drink only when you have no food in your mouth;\n-Sip instead of gulping;\n-if you're a woman, don't wear so much lipstick that your drinking glass will become smudged."
    }
}
