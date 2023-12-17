//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-04-01.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
