//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-04-27.
//

import Foundation
import SwiftUI

class HapticManager{
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type:UINotificationFeedbackGenerator.FeedbackType){
        generator.notificationOccurred(type)
        
    }
    
    
    
    
}
