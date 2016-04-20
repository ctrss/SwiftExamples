//
//  SyDate.swift
//  DeviceViewer
//
//  Created by Stuart on 2016. 4. 20..
//  Copyright © 2016년 kakao. All rights reserved.
//

import Foundation

class SyDate {
    struct Format {
        static var formatter:NSDateFormatter = NSDateFormatter()
        static var dateFormat:String? {
            set(format) {
                self.formatter.dateFormat = format
            }
            get {
                return self.formatter.dateFormat
            }
        }
    };
    var date:NSDate?
    
    func SyDate(dateStr: String) {
        date = Format.formatter.dateFromString(dateStr)
    }
    func SyDate(pureDate: NSDate) { self.date = pureDate }
    
    func toString() -> String {
        return Format.formatter.stringFromDate(date!)
    }
}