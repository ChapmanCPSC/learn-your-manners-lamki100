//
//  Eating.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct Eating : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Eating"
        self.image = "eating.jpg"
        self.description = "\nWHEN TO START EATING:\nAt a small table of only two to four people, wait until everyone else has been served before starting to eat. At a formal or business meal, you should either wait until everyone is served to start or begin when the host asks you to.\n\nHANDLING UTENSILS:\nThe continental table manners style prevails at all meals, formal and informal, because it is a natural, non-disruptive way to eat.\n\n-Hold your fork in your left hand, tines downward.\n-Hold your knife in your right hand, an inch or two above the plate.\n-Extend your index finger along the top of the blade.\n-Use your fork to spear and lift food to your mouth.\n-If your knife is not needed, it remains on the table.\n\nAt informal meals the dinner fork may be held tines upward, American table manners style."
    }
}
