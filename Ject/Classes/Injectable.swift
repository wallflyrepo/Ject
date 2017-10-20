//
//  Injectable.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

/**
 * Defining protocol for an Injectable (Dependency)
 **/
public protocol Injectable {
    
    /**
     * Default empty constructor.
     **/
    init()
    
    /**
     * Should always return an instance of the class itself (which implements Injectable).
     * Here you can inject dependencies the current dependency needs.
     **/
    func inject(dependencyGraph: DependencyGraph) -> Injectable
    
    /**
     * Return true if only one instance of the Injectable class should live and false if it should be
     * instantiated every time it is requested from the DependencyManager.
     **/
    func isSingleton() -> Bool
    
}
