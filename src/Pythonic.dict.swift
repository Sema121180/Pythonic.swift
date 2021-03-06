// Python docs: https://docs.python.org/2/library/stdtypes.html#mapping-types-dict
//
// Most frequently used:
//   12 dict.get
//    4 dict.fromkeys
//    2 dict.keys
//    1 dict.iteritems
//    1 dict.has_key
//
// >>> filter(lambda s: not s.startswith("_"), dir({}))
//   clear: Implemented.
//   copy
//   fromkeys: Implemented.
//   get: Implemented.
//   has_key: Implemented as hasKey.
//   items: Implemented.
//   iteritems
//   iterkeys
//   itervalues
//   keys: Already in Swift (instance variable, not method).
//   pop: Implemented.
//   popitem: Implemented.
//   setdefault
//   update
//   values: Already in Swift (instance variable, not method).
//   viewitems
//   viewkeys
//   viewvalues

public typealias dict = Swift.Dictionary

extension Dictionary: BooleanType {
    public var boolValue: Bool {
        return len(self) != 0
    }
}

public extension Dictionary {
    public mutating func clear() {
        self.removeAll()
    }

    public func get(key: Key) -> Value? {
        return self[key]
    }

    public func hasKey(key: Key) -> Bool {
        if let _ = self.get(key) {
            return true
        }
        return false
    }

    public func has_key(key: Key) -> Bool {
        return hasKey(key)
    }

    public mutating func pop(key: Key) -> Value? {
        if let val = self.get(key) {
            self.removeValueForKey(key)
            return val
        }
        return nil
    }

    public mutating func popItem() -> (Key, Value)? {
        if self.count == 0 {
            return nil
        }
        let key = Array(self.keys)[0]
        let value = self.pop(key)!
        return (key, value)
    }

    public mutating func popitem() -> (Key, Value)? {
        return popItem()
    }

    public func items() -> [(Key, Value)] {
        var ret: [(Key, Value)] = []
        for (key, value) in zip(self.keys, self.values) {
            ret.append((key, value))
        }
        return ret
    }

    public static func fromKeys(sequence: [Key], _ defaultValue: Value) -> [Key: Value]{
        var dict = [Key: Value]()
        for key in sequence {
            dict[key] = defaultValue
        }
        return dict
    }

    public static func fromkeys(sequence: [Key], _ defaultValue: Value) -> [Key: Value] {
        return fromKeys(sequence, defaultValue)
    }

    public func copy() -> [Key: Value] {
        return self
    }
}
