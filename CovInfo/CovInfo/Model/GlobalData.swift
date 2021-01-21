//
//  GlobalData.swift
//  CovInfo
//
//  Created by Vlad Lopes on 09/04/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import Foundation

struct GlobalData: Decodable {
    let results: [Detail]
    
    struct Detail: Decodable {
        let total_cases: Int
        let total_recovered: Int
        let total_unresolved: Int
        let total_deaths: Int
        let total_new_cases_today: Int
        let total_new_deaths_today: Int
        let total_active_cases: Int
        let total_serious_cases: Int
    }
    
}
