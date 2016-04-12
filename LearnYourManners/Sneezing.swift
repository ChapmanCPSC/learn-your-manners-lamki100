//
//  Sneezing.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct Sneezing : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Sneezing"
        self.image = "sneezing.jpg"
        self.description = "Sneeze politely. When you're in a group of people, you'll surely be given the evil eye if you wind up for a sneeze and deliver with flying success. You're spreading germs and disrupting the flow, so it's best to sneeze as discretely as possible.\n\n-Sneezing into your elbow can diffuse the sound. If that's not an option, grab a tissue, tilt your head down, and sneeze as quietly as possible."
    }
}
