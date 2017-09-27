//
//  Injectable.swift
//  Pods
//
//  Created by Williams, Joshua on 9/25/17.
//
//

import Foundation

public protocol Injectable {
    
    init()
    
    func inject(dependencyGraph: Graph) -> Injectable
    
    func isSingleton() -> Bool
    
}
