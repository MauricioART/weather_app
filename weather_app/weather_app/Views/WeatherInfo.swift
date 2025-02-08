//
//  WeatherInfo.swift
//  weather_app
//
//  Created by Diplomado on 07/02/25.
//

import SwiftUI

struct WeatherInfo: View {
    
    @State var isCelcius = false
    var body: some View {
        VStack(alignment:.center){
            Toggle(isOn: $isCelcius){
            }
            HStack(alignment: .center){
                Spacer()
                Text("⛅️").font(.system(size: 60))
                //Image(systemName: "cloud").resizable()
                  //  .frame(width: 40, height: 30)
                Spacer()
                Text("17" + " °").font(.system(size: 70)).bold()
                Spacer()
                Text("UV: 1.0")
                Spacer()
            }
            HStack{
                
                Text("11/03/2025")
                Text("23:01")
                
            }
        }
    }
}

#Preview {
    WeatherInfo()
}
