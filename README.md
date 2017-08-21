NotificationTokenCenter 2017
============================================

## Welcome to Swift


## AddObserver (register)
NotificationTokenCenter.default.addObserver(for: self, name: ViewControllerNotification) { (wrapper: NotificationWrapper<Int>) in
	let object = wrapper.object ?? 0
	print(object)
}

## RemoveObserver (unregister)
NotificationTokenCenter.default.removeObserver(for: self)