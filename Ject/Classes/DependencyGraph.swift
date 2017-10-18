//
//  DependencyGraph.swift
//  Ject
//
//  Created by Williams, Joshua on 10/1/17.
//

import Foundation

/**
 * Defining protocol for Dependency Graphs.
 **/
public protocol DependencyGraph {
    
    /**
     * Injects an Injectable dependency into a class using its Type (Class.self).
     **/
    func inject<T: Injectable>(_ injectableClass: T.Type) -> T
    
    /**
     * Injects an Injectable dependency into a class using an instance of the class.
     **/
    func inject<T: Injectable>(_ injectableClass: Injectable) -> T
    
}

