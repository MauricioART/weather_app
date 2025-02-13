//
//  WeatherInfo.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct WeatherInfo: View {
    
    var weather: Weather
    
    var body: some View {
        var date = Date(weather.location.localtime)
        VStack(alignment:.center){
//            Picker(selection: <#T##Binding<Hashable>#>, content: <#T##() -> View#>, label: <#T##() -> View#>)
            HStack(alignment: .center){
                Spacer()
                AsyncImage(url: URL(string: weather.current.condition.icon)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                
                Spacer()
                Text("\(weather.current.temp_c)" + " °").font(.system(size: 70)).bold()
                Spacer()
                Text("UV: " + "\(weather.uv)")
                Spacer()
            }
            HStack{
                
                
                Text("Time")
                
            }
        }
    }
}


