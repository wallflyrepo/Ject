//
//  DependencyManager.swift
//  Ject
//
//  Created by Williams, Joshua on 10/1/17.
//

import Foundation

/**
 * Default dependency manager, allows you to use your own DependencyGraph or the default.
 * Provides mirrored injection methods for simplicity.
 **/
public class DependencyManager {
    
    /**
     * Instance of the DependencyGraph provided to it.
     **/
    private var graph: DependencyGraph
    
    /**
     * Constructor. Allows you to define your own DependencyGraph.
     **/
    public init(graph: DependencyGraph = Graph.newInstance()) {
        self.graph = graph
    }
    
    /**
     * Allows you to Inject a dependency using its type.
     **/
    public func inject<T: Injectable>(_ injectableClass: T.Type) -> T {
        return self.graph.inject(injectableClass)
    }
    
    /**
     * Allows you to Inject a dependency from an instance.
     **/
    public func inject<T: Injectable>(_ injectableClass: Injectable) -> T {
        return self.graph.inject(injectableClass)
    }
    
}

