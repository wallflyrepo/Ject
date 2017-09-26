//
//  Graph.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

class Graph {
    
    private var mDependencyGraph = [String: Injectable]()
    
    private let mLogManager: LogManager
    
    init(_ logManager: LogManager) {
        mLogManager = logManager
    }
    
    private func getClassName(_ type: Any) -> String {
        return String(describing: type)
    }
    
    private func getDependency<T: Injectable>(_ injectableClass: Any) -> T? {
        let className = getClassName(injectableClass)
        if let dependency = mDependencyGraph[className] {
            mLogManager.print("Dependency \(className) was found.")
            return dependency as? T
        }
        mLogManager.print("Dependency \(className) was not found. instantiating.")
        return nil
    }
    
    func inject<T: Injectable>(_ injectableClass: T.Type) -> T {
        return inject(injectableClass.init())
    }
    
    func inject<T: Injectable>(_ injectableClass: Injectable) -> T {
        let key = type(of: injectableClass as Any)
        
        var resolvedDependency: T
        if(injectableClass.isSingleton()) {
            if let dependency: T = getDependency(key) {
                return dependency
            }
            mDependencyGraph[getClassName(key)] = injectableClass.inject(dependencyGraph: self)
            resolvedDependency = inject(injectableClass)
        } else {
            resolvedDependency = injectableClass.inject(dependencyGraph: self) as! T
        }
        return resolvedDependency
    }
    
}
