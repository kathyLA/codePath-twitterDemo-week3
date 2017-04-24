//
//  Utility.swift
//  TwitterDemo
//
//  Created by kathy yin on 4/16/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import Foundation

enum tweetsMode: String {
    case home = "Home"
    case profile = "Profile"
    case mentions = "Mentions"
}

class Utility {
    class func formatTime(date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        var time: String = ""
        if year > 0 {
            time = String(year) + "y"
        }
        
        if month > 0 {
            time = String(month) + "m"
        }
        
        if day > 0 {
            time = String(day) + "d"
        }
        
        if hour > 0 {
            time = String(hour) + "h"
        }
        
        if( time == ""){
            time = "0m"
        } else {
            if minutes > 0 {
                time = String(minutes) + "m"
            }
        }
        return time
    }
}
