//
//  HTMLParser.swift
//  DeviceViewer
//
//  Created by Stuart on 2016. 4. 19..
//  Copyright © 2016년 kakao. All rights reserved.
//

import Foundation

class HTMLParser {
    enum ParseError: ErrorType {
        case Empty
        case NotExist
    }
    
    
    var htmltext: String?
    var currHtml: String?
    
    func LoadHTMLString(urlStr : String, onComplete: ((Bool!) -> Void)) {
        let url = NSURL(string: urlStr)
    
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { data, response, error in
            if data == nil || error != nil {
                print(error)
                onComplete(false)
                return
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.htmltext = String(data: data!, encoding: NSUTF8StringEncoding)
                self.currHtml = self.htmltext
                onComplete(true)
            }
        }
        task.resume()
        
        return;
    }
    
    func MoveToStartTag(elementName name: String, index idx: Int) throws {
        guard currHtml != nil else { throw ParseError.Empty }
        let range = currHtml?.rangeOfString("<\(name)")
        guard range != nil else { throw ParseError.NotExist }
        
        currHtml = currHtml?.substringFromIndex(range!.startIndex.advancedBy(idx + 1))
    }
    
    func GetAttribute(attributeName name: String) -> String? {
        let startRange = currHtml?.rangeOfString("\(name)=\"")
        let endRange = currHtml?.rangeOfString("\">")
        
        return (currHtml?.substringFromIndex(startRange!.endIndex))?.substringToIndex(endRange!.startIndex.advancedBy(-1))
    }
    
    func GetContent() -> String? {
        let startRange = currHtml?.rangeOfString(">")
        let tempHtml = currHtml?.substringFromIndex(startRange!.startIndex)
        let endRange = tempHtml?.rangeOfString("<")

        let content = (currHtml?.substringFromIndex(startRange!.endIndex))?.substringToIndex(endRange!.startIndex.advancedBy(-1))
        return content?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
}