//
//  LogManager.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

internal class LogManager {
    
    private let mParentClass: AnyObject
    
    init(_ parentClass: AnyObject) {
        mParentClass = parentClass
    }
    
    func print(_ log: Int, functionName: String = #function) {
        self.printLog(log: String(log), functionName: functionName)
    }
    
    func print(_ log:String, functionName: String = #function) {
        self.printLog(log: log, functionName: functionName)
    }
    
    fileprivate func printLog(log : String, functionName: String = #function) {
        #if DEBUG
            let className = String(describing: type(of: mParentClass)).components(separatedBy: ".").last!
            NSLog("[\(className).\(functionName)] - \(log) \n")
        #else
            NSLog("Statement logged. App is in production. Use Debug build to see log statements")
        #endif
    }
    
}
