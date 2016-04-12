//
//  Restroom.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct Restroom : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Using the Restroom"
        self.image = "restroom.jpg"
        self.description = "When you find yourself in the bathroom just try and relax. Claim whatever stall or urinal you desire, close your eyes, slump your shoulders, and just do you. Don't think. Don't listen to your surroundings, just let yourself go. If this doesn't get you relaxed enough you can even add in a little breathing exercise. Try whistling softly, if you are alone, or humming a tune. The goal is to get your mind off of the topic at hand."
    }
}
