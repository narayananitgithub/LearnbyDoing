//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Narayanasamy on 03/10/23.
//

import SwiftUI


// MARK : - CARD MODEL

struct Card: Identifiable {
    
    var id = UUID()
    var title: String
    var headLine: String
    var imageName:String
    var callToAction: String
    var message: String
    var gradientColors:[Color]
}

