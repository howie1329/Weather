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
    var minTemp = ""
    var maxTemp = ""
    var simpleDescription = ""
    var windSpeed = ""
    
    init(){
        getWeather(lat: latitude, long: longitude)
    }
    
    
    // MARK: Method To Get Current Weather Conditions
    
    func getWeather(lat:Double,long:Double){
        // Create URL
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&units=imperial&appid=\(API_KEY)"
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
                    self.minTemp = String(format: "%.0f", self.CityModel.main?.temp_min ?? 0.00)
                    self.maxTemp = String(format: "%.0f", self.CityModel.main?.temp_max ?? 0.00)
                    self.simpleDescription = self.CityModel.weather?[0].main ?? "NONE"
                    self.windSpeed = String(format:"%.0f",self.CityModel.wind?.speed ?? 0.00)
                    print(result)
                }
                catch{
                    print(error)
                }
            }
        }
        
        dataTask.resume()
    }
}
