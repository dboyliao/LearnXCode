//
//  rating.swift
//  Passer Rating
//
//  Created by DboyLiao on 2/4/16.
//  Copyright © 2016 dboyliao. All rights reserved.
//

import Foundation

/// Define a function that pins a Double to the range for
/// a component of an NFL/CFL passer rating.
let ratingPinner = limitPinner(0.0, upper:2.375)

/// Calculate the NFL/CFL passer rating, given performance
/// statistics for a game (or any other time period).
func passer_rating(completions: Int, attempts: Int, yards: Int, touchdowns: Int, interceptions: Int) -> Double
{
    
    if (attempts <= 0) { return 0.0 }
    
    //  Statistic-per-attempt, with both converted to Double,
    //  recurs in all four compnents. Make the definitions
    //  easier to read and understand by encapsuating it.
    func perAttempt(stat:Int) -> Double {
        return Double(stat) / Double (attempts)
    }
    
    //  Compute the components to sum into the rating
    let components = [(100.0 * perAttempt(completions) - 30.0)/20.0,
                      (perAttempt(yards) - 0.3)/4.0,
                       20.0 * perAttempt(touchdowns),
                       2.375 - (25.0 * perAttempt(interceptions))
                     ]
    
    //  Pin the components and add them up
    let retval = components.map(ratingPinner).reduce(0.0, combine: +)
    
    return 100.0 * retval / 6.0
}