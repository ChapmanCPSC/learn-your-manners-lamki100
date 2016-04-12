//
//  ExcuseMe.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct ExcuseMe : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Saying Excuse Me"
        self.image = "excuseMe.jpg"
        self.description = "This is generally a term to ask permission for something. For example, you're walking through a crowded space and someone (with their back to you) is in your way. You would say \"excuse me\" to ask them to move out of your way."
    }
}
