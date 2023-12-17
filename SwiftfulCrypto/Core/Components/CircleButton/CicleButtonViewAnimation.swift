//
//  CicleButtonViewAnimation.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-03-27.
//

import SwiftUI

struct CicleButtonViewAnimation: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none)
        
    }
}

struct CicleButtonViewAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CicleButtonViewAnimation(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
