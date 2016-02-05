//
//  Utilities.swift
//  Passer Rating
//
//  Created by DboyLiao on 2/4/16.
//  Copyright © 2016 dboyliao. All rights reserved.
//

import Foundation

func pinComparables<T:Comparable>(value:T, lower:T, upper:T) -> T
{
    let retValue:T
    if value < lower {
        retValue = lower
    } else if value > upper {
        retValue = upper
    } else {
        retValue = value
    }
    return retValue
}

func limitPinner<T:Comparable>(lower:T, upper:T) -> (T -> T)
{
    return {value in pinComparables(value, lower: lower, upper: upper)}
}