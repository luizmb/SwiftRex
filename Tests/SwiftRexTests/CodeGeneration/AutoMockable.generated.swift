// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all
import Foundation
@testable import SwiftRex
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif













class ActionHandlerMock<ActionType>: ActionHandler {

    //MARK: - dispatch

    var dispatchCallsCount = 0
    var dispatchCalled: Bool {
        return dispatchCallsCount > 0
    }
    var dispatchReceivedDispatchedAction: DispatchedAction<ActionType>?
    var dispatchClosure: ((DispatchedAction<ActionType>) -> Void)?

    func dispatch(_ dispatchedAction: DispatchedAction<ActionType>) {
        dispatchCallsCount += 1
        dispatchReceivedDispatchedAction = dispatchedAction
        dispatchClosure?(dispatchedAction)
    }

}
class MiddlewareMock<InputActionType, OutputActionType, StateType>: Middleware {

    //MARK: - receiveContext

    var receiveContextGetStateOutputCallsCount = 0
    var receiveContextGetStateOutputCalled: Bool {
        return receiveContextGetStateOutputCallsCount > 0
    }
    var receiveContextGetStateOutputReceivedArguments: (getState: GetState<StateType>, output: AnyActionHandler<OutputActionType>)?
    var receiveContextGetStateOutputClosure: ((@escaping GetState<StateType>, AnyActionHandler<OutputActionType>) -> Void)?

    func receiveContext(getState: @escaping GetState<StateType>, output: AnyActionHandler<OutputActionType>) {
        receiveContextGetStateOutputCallsCount += 1
        receiveContextGetStateOutputReceivedArguments = (getState: getState, output: output)
        receiveContextGetStateOutputClosure?(getState, output)
    }

    //MARK: - handle

    var handleActionFromAfterReducerCallsCount = 0
    var handleActionFromAfterReducerCalled: Bool {
        return handleActionFromAfterReducerCallsCount > 0
    }
    var handleActionFromAfterReducerReceivedArguments: (action: InputActionType, dispatcher: ActionSource, afterReducer: AfterReducer)?
    var handleActionFromAfterReducerClosure: ((InputActionType, ActionSource, inout AfterReducer) -> Void)?

    func handle(action: InputActionType, from dispatcher: ActionSource, afterReducer: inout AfterReducer) {
        handleActionFromAfterReducerCallsCount += 1
        handleActionFromAfterReducerReceivedArguments = (action: action, dispatcher: dispatcher, afterReducer: afterReducer)
        handleActionFromAfterReducerClosure?(action, dispatcher, &afterReducer)
    }

}
class ReduxStoreProtocolMock<ActionType, StateType>: ReduxStoreProtocol {
    var pipeline: ReduxPipelineWrapper<MiddlewareType> {
        get { return underlyingPipeline }
        set(value) { underlyingPipeline = value }
    }
    var underlyingPipeline: ReduxPipelineWrapper<MiddlewareType>!
    var statePublisher: UnfailablePublisherType<StateType> {
        get { return underlyingStatePublisher }
        set(value) { underlyingStatePublisher = value }
    }
    var underlyingStatePublisher: UnfailablePublisherType<StateType>!

}
class StateProviderMock<StateType>: StateProvider {
    var statePublisher: UnfailablePublisherType<StateType> {
        get { return underlyingStatePublisher }
        set(value) { underlyingStatePublisher = value }
    }
    var underlyingStatePublisher: UnfailablePublisherType<StateType>!

}
class StoreTypeMock<ActionType, StateType>: StoreType {
    var statePublisher: UnfailablePublisherType<StateType> {
        get { return underlyingStatePublisher }
        set(value) { underlyingStatePublisher = value }
    }
    var underlyingStatePublisher: UnfailablePublisherType<StateType>!

    //MARK: - dispatch

    var dispatchCallsCount = 0
    var dispatchCalled: Bool {
        return dispatchCallsCount > 0
    }
    var dispatchReceivedDispatchedAction: DispatchedAction<ActionType>?
    var dispatchClosure: ((DispatchedAction<ActionType>) -> Void)?

    func dispatch(_ dispatchedAction: DispatchedAction<ActionType>) {
        dispatchCallsCount += 1
        dispatchReceivedDispatchedAction = dispatchedAction
        dispatchClosure?(dispatchedAction)
    }

}
