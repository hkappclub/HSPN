//
//  Data.swift
//  HSPN
//
//  Created by Kobi Greene on 12/8/16.
//  Copyright © 2016 Kobi Greene. All rights reserved.
//

import Foundation

class Team {
    var name: String = ""
    var season: String = ""
    var roster: [String] = [String]()
    var schedule: Array<Array<String>> = Array<Array<String>>()
    
}


class User {
    var favorite: [Team] = [Team]()
}
