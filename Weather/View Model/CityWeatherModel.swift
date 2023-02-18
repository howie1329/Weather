//
//  CityWeatherModel.swift
//  Weather
//
//  Created by Howard Thomas on 2/17/23.
//

import Foundation

class CityWeatherModel: ObservableObject {
    @Published var CityModel = City()
    
    private let API_KEY = "48a5ecddd3054196fd38d3734e2db84d"
    private let latitude = 40.730610
    private let longitude = -73.935242
    
    var feelsLike = ""
    var currentTemp = ""
    var description = ""
    init(){
        getWeather()
    }
    
    
    
    func getWeather(){
        // Create URL
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=imperial&appid=\(API_KEY)"
        let url = URL(string: urlString)
        
        // Get URL Request
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        // Get URL Session
        let session = URLSession.shared
        
        // Create Data Task
        let dataTask = session.dataTask(with: request) {( data, response, error) in
            
            if error == nil {
                do{
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(City.self, from: data!)
                    self.CityModel = result
                    self.feelsLike = String(format:"%.0f",self.CityModel.main?.feels_like ?? 0.00)
                    self.currentTemp = String(format:"%.0f",self.CityModel.main?.temp ?? 0.00)
                    self.description = self.CityModel.weather?[0].description ?? "NONE"
                    print(result)
                }
                catch{
                    print(error)
                }
            }
        }
        
        dataTask.resume()
        
        //
    }
}
