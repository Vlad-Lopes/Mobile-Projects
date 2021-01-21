//
//  InfoManager.swift
//  CovInfo
//
//  Created by Vlad Lopes on 05/04/20.
//  Copyright © 2020 Vlad Lopes. All rights reserved.
//

import Foundation
import CoreLocation

protocol InfoManagerDelegate {
    func didUpdateInfo(info: InfoModel)
    
    func didFailWithError(error: Error)
}

var type = "Global"

struct InfoManager {

    let infoURL = "https://api.thevirustracker.com/free-api?"
    var delegate: InfoManagerDelegate?
    
    func FetchInfo (country: String) {
        if country == "**" {
            type = "Global"
            performRequest(urlString: "\(infoURL)global=stats")
            
        } else {
             type = "Local"
             performRequest(urlString: "\(infoURL)countryTotal=\(country)")
        }
    }
    
    func performRequest(urlString: String){
    // 1 - Create an URL
        if let url = URL(string: urlString) {
    // 2 - Create a Session
            let session = URLSession(configuration: .default)
    // 3 - Give the Session a Task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let info = self.parseJSON(infoData: safeData) {
                        self.delegate?.didUpdateInfo(info: info)
                    }
                }
            }
    // 4 - Start the Task
            task.resume()
        }
    }
    
    func parseJSON(infoData: Data) -> InfoModel? {
        let decoder = JSONDecoder()
        do {
            if type == "Global" {
                let decoderData = try decoder.decode(GlobalData.self, from: infoData)

                let name = "Total Global"
                let confirm = decoderData.results[0].total_cases
                let deaths = decoderData.results[0].total_deaths
                let recover = decoderData.results[0].total_recovered
                let newCases = decoderData.results[0].total_new_cases_today
                let newDeaths = decoderData.results[0].total_new_deaths_today
                let actives = decoderData.results[0].total_active_cases
                let serious = decoderData.results[0].total_serious_cases
                let info = InfoModel(name: name, confirmed: confirm, deaths: deaths, recovered: recover, newCases: newCases, newDeaths: newDeaths, actives: actives, serious: serious)
                return info
                
            } else {
                let decoderData = try decoder.decode(InfoData.self, from: infoData)

                let name = decoderData.countrydata[0].info.title
                let confirm = decoderData.countrydata[0].total_cases
                let deaths = decoderData.countrydata[0].total_deaths
                let recover = decoderData.countrydata[0].total_recovered
                let newCases = decoderData.countrydata[0].total_new_cases_today
                let newDeaths = decoderData.countrydata[0].total_new_deaths_today
                let actives = decoderData.countrydata[0].total_active_cases
                let serious = decoderData.countrydata[0].total_serious_cases
                let info = InfoModel(name: name, confirmed: confirm, deaths: deaths, recovered: recover, newCases: newCases, newDeaths: newDeaths, actives: actives, serious: serious)
                return info
            }
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
