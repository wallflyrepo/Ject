//
//  Graph.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

/**
 * Default Dependency Graph. This graph determines whether a dependency is a Singleton or not. If it is a Singleton, it is stored in a dictionary
 * to be used later. This class is public so you can subclass it.
 **/
public class Graph: DependencyGraph {
    
    /**
     * Dictionary that holds singleton dependencies
     **/
    private var singletonDependencyGraph = [String: Injectable]()
    
    /**
     * LogManager instance to log things.
     **/
    private var logManager: LogManager?
 
    /**
     * Default constructor
     **/
    init() {
        //Default Constructor
    }
    
    /**
     * Instantiate this class with a log manager
     **/
    init(_ logManager: LogManager) {
        self.logManager = logManager
    }
    
    /**
     * Construct a new default instance.
     **/
    public static func newInstance() -> Graph {
        return Graph(LogManager(Graph.self))
    }
  
    /**
     * Retrieves the name of the class passed as a parameter.
     **/
    private func description(_ type: Any) -> String {
        return String(describing: type)
    }
    
    /**
     * Returns a dependency from the singleton dependency graph or nil
     **/
    private func getDependency<T: Injectable>(_ injectableClass: Any) -> T? {
        let className = description(injectableClass)
        guard let dependency = singletonDependencyGraph[className] else {
            logManager?.print("Dependency \(className) was not found. instantiating.")
            return nil
        }
        logManager?.print("Dependency \(className) was found.")
        return dependency as? T
    }
    
    /**
     * Injects an Injectable dependency into a class using its Type (Class.self).
     **/
    public func inject<T: Injectable>(_ injectableClass: T.Type) -> T {
        return inject(injectableClass.init())
    }
    
    /**
     * Injects an Injectable dependency into a class using an instance of the class.
     **/
    public func inject<T: Injectable>(_ injectableClass: Injectable) -> T {
        let key = type(of: injectableClass as Any)
        
        var resolvedDependency: T
        if(injectableClass.isSingleton()) {
            if let dependency: T = getDependency(key) {
                return dependency
            }
            singletonDependencyGraph[description(key)] = injectableClass.inject(dependencyGraph: self)
            resolvedDependency = inject(injectableClass)
        } else {
            resolvedDependency = injectableClass.inject(dependencyGraph: self) as! T
        }
        return resolvedDependency
    }
    
}
