//
//  GivingComplements.swift
//  LearnYourManners
//
//  Created by Katie on 4/12/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import Foundation

struct GivingCompliments : Manner {
    
    var name: String
    var image: String
    var description: String
    
    init()
    {
        self.name = "Giving Compliments"
        self.image = "givingCompliments.png"
        self.description = "Focus on achievements more than physical traits. It’s always nice to get a compliment like “You’re so pretty” or “I like your shoes,” but the best compliments are those that point out someone’s awesome achievements or personal qualities. Complimenting people on something they’ve worked on means more than complimenting the person on something they have nothing to do with, like the color of their eyes.\n\n -If you’re looking for a nice compliment to give to the girl you have a crush on, she’ll probably respond better to “I think your English essay was brilliant” than to “Your lips are sexy” or “you have a really nice chin.”"
    }
}
