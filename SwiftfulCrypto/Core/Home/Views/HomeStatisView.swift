//
//  HomeStatisView.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-04-02.
//

import SwiftUI

struct HomeStatisView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    var body: some View {
        HStack{
            ForEach(vm.statistics){stat in  StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatisView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
