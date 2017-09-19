//
//  AsyncOperation.swift
//  Pods
//
//  Created by Nicholas Schlueter on 9/15/17.
//
//

import Foundation

class AsyncOperation: Operation {
    enum State: String {
        case isReady, isExecuting, isFinished
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    var state = State.isReady {
        willSet {
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    override var isExecuting: Bool {
        return state == .isExecuting
    }
    
    override var isFinished: Bool {
        return state == .isFinished
    }
    
    override func start() {
        guard !self.isCancelled else {
            state = .isFinished
            return
        }
        
        state = .isExecuting
        main()
    }
}