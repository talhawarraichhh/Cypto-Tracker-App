//
//  MarketDataModel.swift
//  SwiftfulCrypto
//
//  Created by Talha Warraich on 2023-04-04.
//JSON Data:
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON Response: {
 "data": {
   "active_cryptocurrencies": 10953,
   "upcoming_icos": 0,
   "ongoing_icos": 49,
   "ended_icos": 3376,
   "markets": 706,
   "total_market_cap": {
     "btc": 43781135.64946967,
     "eth": 654334299.9034706,
     "ltc": 13350250625.549112,
     "bch": 9727667799.709858,
     "bnb": 3994712340.7304597,
     "eos": 1032761589311.1886,
     "xrp": 2467819088321.9653,
     "xlm": 11726313727443.203,
     "link": 166469755759.46158,
     "dot": 191161245838.77127,
     "yfi": 143037455.29127657,
     "usd": 1248232614151.7046,
     "aed": 4584215410592.0625,
     "ars": 263093857605858.25,
     "aud": 1846962366320.937,
     "bdt": 131897715869786.55,
     "bhd": 470568716743.8203,
     "bmd": 1248232614151.7046,
     "brl": 6331784758545.926,
     "cad": 1677281369450.9976,
     "chf": 1130426916493.2947,
     "clp": 1006639205081848,
     "cny": 8587216269056.627,
     "czk": 26743951704039.69,
     "dkk": 8484698924456.369,
     "eur": 1138695209329.434,
     "gbp": 999346264983.3834,
     "hkd": 9798244061910.947,
     "huf": 430209083628059.8,
     "idr": 18670439326174104,
     "ils": 4463005782594.857,
     "inr": 102457429434800.33,
     "jpy": 164138036381711.44,
     "krw": 1639018578643885.8,
     "kwd": 382673168985.71606,
     "lkr": 401231468342067.56,
     "mmk": 2624888477457610,
     "mxn": 22628790904030.477,
     "myr": 5489727037039.187,
     "ngn": 574598919272452.6,
     "nok": 12858990318698.215,
     "nzd": 1978854369030.05,
     "php": 68024930276960.28,
     "pkr": 358721034318209.75,
     "pln": 5328758703816.022,
     "rub": 98984838812834.55,
     "sar": 4681887116184.204,
     "sek": 12821630716556.66,
     "sgd": 1654142881482.4658,
     "thb": 42403086019040.48,
     "try": 24000267765340.48,
     "twd": 37941152468261.164,
     "uah": 45936356973078.14,
     "vef": 124985531655.0099,
     "vnd": 29290924998684212,
     "zar": 22362469241707.688,
     "xdr": 929130683972.1205,
     "xag": 49964280043.91658,
     "xau": 617862661.6789497,
     "bits": 43781135649469.67,
     "sats": 4378113564946967.5
   },
   "total_volume": {
     "btc": 1805883.8285228203,
     "eth": 26989974.405969806,
     "ltc": 550670999.136082,
     "bch": 401246740.36295784,
     "bnb": 164773853.13811666,
     "eos": 42599339308.80556,
     "xrp": 101792576122.32703,
     "xlm": 483686866830.53973,
     "link": 6866542756.475911,
     "dot": 7885017082.801367,
     "yfi": 5900007.470151158,
     "usd": 51487085903.36974,
     "aed": 189089669640.70944,
     "ars": 10852092705819.525,
     "aud": 76183484501.95178,
     "bdt": 5440515614199.9375,
     "bhd": 19410013540.539448,
     "bmd": 51487085903.36974,
     "brl": 261173391953.43292,
     "cad": 69184484505.50543,
     "chf": 46627837709.9815,
     "clp": 41521843475442.055,
     "cny": 354205407472.23114,
     "czk": 1103134242103.782,
     "dkk": 349976773106.9883,
     "eur": 46968888167.005356,
     "gbp": 41221024358.011,
     "hkd": 404157869293.1659,
     "huf": 17745259812988.555,
     "idr": 770118087399652.2,
     "ils": 184090016164.06253,
     "inr": 4226162985120.4,
     "jpy": 6770364019801.608,
     "krw": 67606221307722.17,
     "kwd": 15784498899.567856,
     "lkr": 16549991438657.041,
     "mmk": 108271372653943.58,
     "mxn": 933392132168.411,
     "myr": 226440203803.01968,
     "ngn": 23701050253898.13,
     "nok": 530407499101.72565,
     "nzd": 81623764459.7596,
     "php": 2805891617501.772,
     "pkr": 14796521497588.918,
     "pln": 219800583666.17874,
     "rub": 4082925603214.7075,
     "sar": 193118431138.47623,
     "sek": 528866490620.63794,
     "sgd": 68230068394.11461,
     "thb": 1749042051680.4216,
     "try": 989962795498.4512,
     "twd": 1564996262923.1497,
     "uah": 1894782375293.1396,
     "vef": 5155401911.504401,
     "vnd": 1208191770106341.8,
     "zar": 922406899007.1542,
     "xdr": 38324772801.7746,
     "xag": 2060926104.2817967,
     "xau": 25485592.651308887,
     "bits": 1805883828522.8203,
     "sats": 180588382852282.03
   },
   "market_cap_percentage": {
     "btc": 44.16829466193675,
     "eth": 18.393592373345655,
     "usdt": 6.419248158638135,
     "bnb": 3.9540198070694252,
     "usdc": 2.625358705785469,
     "xrp": 2.0936878784880073,
     "ada": 1.106015370014595,
     "doge": 1.0596869535637998,
     "steth": 0.901226890355217,
     "matic": 0.8378346194826497
   },
   "market_cap_change_percentage_24h_usd": 2.5887535311701395,
   "updated_at": 1680656223
 }
}
 
 
 */
import Foundation
struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
