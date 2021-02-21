//
//  DoubleMetaphoneSwift.swift
//  Pods
//
//  Created by Zebulon Frantzich on 3/11/17.
//
//

import Foundation
import double_metaphone_swift

public class DoubleMetaphoneSwift: NSObject {
    let impl = DoubleMetaphoneImpl()

    private let maxLength: Int
    
    static let instance = DoubleMetaphoneSwift(maxLength: 4)
    
    public static func calculate(input: String) -> (String, String)? {
      return instance.calculate(input:input)
    }
    
    public func calculate(input: String) -> (String, String)? {
        guard
            let response = impl.calculate(input as String?, maxLength: maxLength as NSNumber),
            let primary = response[0] as? String,
            let secondary = response[1] as? String
        else {
            return nil
        }
        
        return (primary, secondary)
    }

    public init(maxLength: Int) {
      self.maxLength = maxLength
      super.init()
    }
}
 
