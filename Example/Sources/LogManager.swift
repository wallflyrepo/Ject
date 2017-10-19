//
//  LogManager.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

/**
 * Allows for a `String` to be logged using NSLog in debug mode only.
 **/
internal class LogManager {
    
    /**
     * Typically the class that instantiated this LogManager instance.
     **/
    private let parentClass: AnyObject
    
    /**
     * Ideally, passing the parent class object allows for us to easily trace where each statement comes from.
     **/
    init(_ parentClass: AnyObject) {
        self.parentClass = parentClass
    }
    
    /**
     * Allows to print numbers using the same print() function for a `String`. Also logs the function name for tracing.
     **/
    func print(_ log: Int, functionName: String = #function) {
        self.printLog(log: String(log), functionName: functionName)
    }
    
    /**
     * Allows to print a `String`. Also logs the function name for tracing.
     **/
    func print(_ log:String, functionName: String = #function) {
        self.printLog(log: log, functionName: functionName)
    }
    
    /**
     * Prints the log statement with the function that it was called in if the build is a Debug build. If not,
     * it prints a log stating that something was logged.
     **/
    fileprivate func printLog(log : String, functionName: String = #function) {
        #if DEBUG
            let className = String(describing: type(of: parentClass)).components(separatedBy: ".").last!
            print("[\(className).\(functionName)] - \(log) \n")
        #else
            print("Statement logged. App is in production. Use Debug build to see log statements")
        #endif
    }
    
    /**
     * Uses NSLog to print a statement.
     **/
    fileprivate func print(log: String) {
        NSLog(log)
    }
    
}
