//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-03-29.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject{
    
    @Published var statistics: [StatisticModel] =  [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var isLoading: Bool = false
    @Published var searchText: String = ""
    @Published var  sortOption: SortOption = .holdings
    private let coinDataService = CoinDataService()
    private let portfolioDataService = PortfolioDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    enum SortOption{
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
        
        
        
    }
    
    init() {
        addSubscribers()
        
        
        
    }
    
    func addSubscribers(){
        
        //updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCoins)
            .sink{[weak self] (returnedCoins) in self?.allCoins = returnedCoins
                
            }
            .store(in: &cancellables)
        // updates marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
        
            .sink{ [weak self](returnedStats) in self?.statistics = returnedStats}
            .store(in: &cancellables)
        
        // updates portfolioCoins
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinstoPortfolioCoins)
            .sink{ [weak self](returnedCoins) in
                guard let self = self else { return}
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
        
    }
    func updatePortfolio(coin: CoinModel, amount: Double){
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
        
        
    }
    func reloadData(){
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
        
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel]{
        var updatedCoins = filterCoins(text: text, coins: coins)
       sortCoins(sort: sortOption, coins: &updatedCoins)
        return updatedCoins
        }
    private func filterCoins(text: String,  coins:[CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else{ return coins}
        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in return coin.name.lowercased().contains(lowercasedText) || coin.symbol.lowercased().contains(lowercasedText) || coin.id.lowercased().contains(lowercasedText)
            
        }
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]){
        switch sort{
        case.rank, .holdings:
            coins.sort(by: {$0.rank < $1.rank})
            
        case.rankReversed, .holdingsReversed:
            coins.sort(by: {$0.rank > $1.rank})
        case .price:
             coins.sort(by: {$0.currentPrice > $1.currentPrice})
        case .priceReversed:  coins.sort(by: {$0.currentPrice < $1.currentPrice})

            
        }}
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel]{
        // will only sort by holdings or reversedHoldings if needed
        switch sortOption{
        case .holdings:
            return coins.sorted(by: {$0.currentPrice > $1.currentPrice})
        case .holdingsReversed:
            return coins.sorted(by: {$0.currentPrice < $1.currentPrice})
        default:
            return coins
            
        }
        
        
    }
    private func mapAllCoinstoPortfolioCoins(allCoins:[CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel]{
        allCoins
            .compactMap{ (coin) -> CoinModel? in guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else{ return nil}
                return coin.updateHoldings(amount: entity.amount)
                
            }}
        private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel]{
            var stats: [StatisticModel] = []
            
            guard let data = marketDataModel else{ return stats}
            let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
            let volume = StatisticModel(title: "24h Volume", value: data.volume)
            let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
            let portfolioValue = portfolioCoins
                .map({$0.currentHoldingsValue})
                .reduce(0, +)
            let previousValue = portfolioCoins
                .map { (coin) -> Double in
                    let currentValue = coin.currentHoldingsValue
                    let percentageChange = coin.priceChangePercentage24H ?? 0 / 100
                    let previousValue = currentValue / (1+percentageChange)
                    return previousValue
                }
                .reduce(0,+)
            
            let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
            let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
            stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])
            return stats
            
            
        }
    }

    
    
    

