//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-04-04.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {presentationMode.wrappedValue.dismiss()}, label: { Image(systemName: "xmark")
                .font(.headline)
            
        })
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
