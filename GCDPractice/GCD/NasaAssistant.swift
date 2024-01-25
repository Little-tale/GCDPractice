//
//  NasaAssistant.swift
//  GCDPractice
//
//  Created by Jae hyung Kim on 1/25/24.
//

import UIKit

enum NasaAssistant: String, CaseIterable {
    static let baseURL = "https://apod.nasa.gov/apod/image/"
    
    case one = "2308/sombrero_spitzer_3000.jpg"
    case two = "2212/NGC1365-CDK24-CDK17.jpg"
    case three = "2307/M64Hubble.jpg"
    case four = "2306/BeyondEarth_Unknown_3000.jpg"
    case five = "2307/NGC6559_Block_1311.jpg"
    case six = "2304/OlympusMons_MarsExpress_6000.jpg"
    case seven = "2305/pia23122c-16.jpg"
    case eight = "2308/SunMonster_Wenz_960.jpg"
    case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
    
    static var getURL : URL? {
        return URL(string: NasaAssistant.baseURL + (NasaAssistant.allCases.randomElement()?.rawValue ?? "https://apod.nasa.gov/apod/image/2308/sombrero_spitzer_3000.jpg"))
    }
    
}
