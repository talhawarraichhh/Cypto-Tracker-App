//
//  CoinImageview.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-03-30.
//

import SwiftUI

struct CoinImageview: View {
    
    @StateObject var vm: CoinImageViewModel
    init(coin: CoinModel){
       _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
        
        
    }
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                .scaledToFit()}
                else if vm.isLoading{
                    
                    ProgressView()
                }
                else{
                    
                    Image(systemName: "questionmark")
                        .foregroundColor(Color.theme.secondaryText)
                }
                
            }
            
            
            
        }
        
    }


struct CoinImageview_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageview(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
