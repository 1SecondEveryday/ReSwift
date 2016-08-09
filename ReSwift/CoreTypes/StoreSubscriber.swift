//
//  StoreSubscriber.swift
//  ReSwift
//
//  Created by Benjamin Encz on 12/14/15.
//  Copyright © 2015 Benjamin Encz. All rights reserved.
//

import Foundation

public protocol AnyStoreSubscriber: class {
    func _initialState(state: Any)
    func _newState(state: Any, action: Action)
}

public protocol StoreSubscriber: AnyStoreSubscriber {
    associatedtype StoreSubscriberStateType

    func initialState(state: StoreSubscriberStateType)
    func newState(state: StoreSubscriberStateType, action: Action)
}

extension StoreSubscriber {
    public func _initialState(state: Any) {
        if let typedState = state as? StoreSubscriberStateType {
            #if swift(>=3)
                initialState(state: typedState)
            #else
                initialState(typedState)
            #endif
        }
    }

    public func _newState(state: Any, action: Action) {
        if let typedState = state as? StoreSubscriberStateType {
            #if swift(>=3)
                newState(state: typedState, action: action)
            #else
                newState(typedState, action: action)
            #endif
        }
    }
}
