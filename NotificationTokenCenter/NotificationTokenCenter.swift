//
//  NotificationTokenCenter.swift
//  NotificationTokenCenter-Demo
//
//  Created by Choi Joongkwan on 2017. 8. 21..
//  Copyright © 2017년 tiny2n. All rights reserved.
//

import UIKit

open class NotificationTokenCenter {
    static let `default` = NotificationTokenCenter()
    
    private init() { }
    private var observers: [String: [Foundation.Notification.Name: NSObjectProtocol]] = [:]
    
    private func describing(_ objRef: AnyObject) -> String {
        return String(describing: Unmanaged<AnyObject>.passUnretained(objRef).toOpaque())
    }
    
    open func addObserver<T>(for key: AnyObject, name: Foundation.Notification.Name, object: Any? = nil, queue: OperationQueue? = OperationQueue.main, using completion: @escaping (NotificationWrapper<T>) -> Void) {
        let forKey = describing(key)
        let token = NotificationCenter.default.addObserver(forName: name, object: object, queue: queue) { (noti) in
            // notification closure
            let object = noti.object as? T
            let wrapper = NotificationWrapper<T>(object, noti.userInfo)
            completion(wrapper)
        }
        
        observers[forKey] = [name: token]
    }
    
    open func removeObserver(for key: AnyObject) {
        let forKey = describing(key)
        observers[forKey]?
            .forEach { NotificationCenter.default.removeObserver($0.value) }
        
        observers[forKey]?.removeAll()
    }
    
    open func removeObserver(for key: AnyObject, name: Foundation.Notification.Name) {
        let forKey = describing(key)
        observers[forKey]?
            .filter { $0.key == name }
            .forEach { NotificationCenter.default.removeObserver($0.value) }
        
        observers[forKey]?.removeValue(forKey: name)
    }
}
