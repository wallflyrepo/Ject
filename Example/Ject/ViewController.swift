//
//  ViewController.swift
//  Ject
//
//  Created by luxnovaco@gmail.com on 09/26/2017.
//  Copyright (c) 2017 luxnovaco@gmail.com. All rights reserved.
//

import UIKit
import Ject

struct Dependencies {
    
    static var instance = Dependencies()
    
    lazy var manager = DependencyManager()
    
    private init(){
        //Default Constructor
    }
    
}

class LogUtils: Injectable {
    
    required init() {
    }
    
    func inject(dependencyGraph: Graph) -> Injectable {
        return LogUtils()
    }
    
    func isSingleton() -> Bool {
        return true
    }
    
    func print(statement: String) {
        print(statement: statement)
    }
    
}

class ViewUtils: Injectable {
    
    var logUtils: LogUtils?
    
    required init() {
        
    }
    
    init(_ logUtils: LogUtils) {
        self.logUtils = logUtils
    }
    
    func inject(dependencyGraph: Graph) -> Injectable {
        return ViewUtils(dependencyGraph.inject(LogUtils.self))
    }
    
    func isSingleton() -> Bool {
        return false
    }
    
    func printViewStuff(view: UIView) {
        logUtils?.print(statement: "View - \(view.tag)")
    }
    
}

class ViewController: UIViewController {
    
    var manager: DependencyManager {
        return Dependencies.instance.manager
    }
    
    var logUtils: LogUtils {
        return manager.inject(LogUtils.self)
    }
    
    var viewUtils: ViewUtils {
        return manager.inject(ViewUtils.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logUtils.print(statement: "Some Statement.")
        
        let imageView = UIImageView()
        imageView.tag = 5
        viewUtils.printViewStuff(view: imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

