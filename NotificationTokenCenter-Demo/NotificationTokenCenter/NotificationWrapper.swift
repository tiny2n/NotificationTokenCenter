//
//  NotificationWrapper.swift
//  NotificationTokenCenter-Demo
//
//  Created by Choi Joongkwan on 2017. 8. 21..
//  Copyright © 2017년 tiny2n. All rights reserved.
//

import UIKit

public struct NotificationWrapper<T> {
    private(set) public var object: T?
    private(set) public var userInfo: [AnyHashable: Any]?
    
    public init(_ object: T?, _ userInfo: [AnyHashable: Any]?) {
        self.object = object
        self.userInfo = userInfo
    }
}
