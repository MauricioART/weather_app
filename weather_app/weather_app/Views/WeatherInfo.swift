//
//  WeatherInfo.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct WeatherInfo: View {
    
    @Binding var weather: Weather
    @State var isCelcius: Bool = true
    
    var body: some View {
        
        var temp: String{
            if isCelcius{
                return "\(weather.current.temp_c)"
            }else{
                return "\(weather.current.temp_f)"
            }
        }

        VStack(alignment:.center){
            Picker("", selection: $isCelcius) {
                Text("C").tag(true)
                Text("F").tag(false)
            }.pickerStyle(SegmentedPickerStyle())


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
                Text(temp + " °").font(.system(size: 70)).bold()
                Spacer()
                Text("UV: " + "\(weather.uv)")
                Spacer()
            }

            HStack{
                Text(weather.location.localtime_str)
            }

        }
    }
}


