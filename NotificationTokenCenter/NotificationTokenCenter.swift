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
    private var observers: [String: [[Foundation.Notification.Name: NSObjectProtocol]]] = [:]
    
    private func describing(_ objRef: AnyObject) -> String {
        return String(describing: Unmanaged<AnyObject>.passUnretained(objRef).toOpaque())
    }
    
    open func addObserver<T>(for key: AnyObject, name: Foundation.Notification.Name, object: Any? = nil, queue: OperationQueue? = OperationQueue.main, using completion: @escaping (NotificationWrapper<T>) -> Void) {
        let forKey = describing(key)
        
        // New observer token
        let token = NotificationCenter.default.addObserver(forName: name, object: object, queue: queue) { (noti) in
            let object = noti.object as? T
            let wrapper = NotificationWrapper<T>(object, noti.userInfo)
            completion(wrapper)
        }
        
        addObserverToken(for: forKey, name: name, token: token)
    }
    
    private func addObserverToken(for key: String, name: Foundation.Notification.Name, token: NSObjectProtocol) {
        // add observer token
        let info = [name: token]
        if var observer = observers[key] {
            observer.append(info)
            observers[key] = observer
        }
        else {
            observers[key] = [info]
        }
    }
    
    open func removeObserver(for key: AnyObject) {
        // Remove existing observer token
        let forKey = describing(key)
        observers[forKey]?.forEach {
            $0.forEach { NotificationCenter.default.removeObserver($0.value) }
        }
        
        observers[forKey]?.removeAll()
    }
    
    open func removeObserver(for key: AnyObject, name: Foundation.Notification.Name) {
        // Remove existing observer token
        let forKey = describing(key)
        let iterator = observers[forKey] ?? []
        for var observer in iterator {
            for info in observer where info.key == name {
                NotificationCenter.default.removeObserver(info.value)
            }
            
            observer.removeValue(forKey: name)
        }
    }
}
