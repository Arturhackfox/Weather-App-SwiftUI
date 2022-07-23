//
//  ContentView.swift
//  Weather App SwiftUI
//
//  Created by Arthur Sh on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundColor(isNight: isNight)
            
            
            
            VStack {
                
                MainCityName(cityName: "Kyiv, UA")
                
                mainWeatherInfo(isNight: isNight, tempratureNumber: 26)
          
                HStack(spacing: 20){
                    
                    WeatherDays(day: "Tue",
                                image: "cloud.sun.fill",
                                temprature: 26)
                    
                    WeatherDays(day: "Wed",
                                image: "wind",
                                temprature: 26)
                    
                    WeatherDays(day: "Thu",
                                image: "cloud.sun.bolt.fill",
                                temprature: 26)
                    
                    WeatherDays(day: "Fri",
                                image: "cloud.bolt.rain.fill",
                                temprature: 26)
                    
                    WeatherDays(day: "Sat",
                                image: "cloud.hail.fill",
                                temprature: 26)
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(textOnButton: "Change Day Time", backColor: .white, frontColor: .blue)
                }
               
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct WeatherDays: View {
    
    var day: String
    var image: String
    var temprature: Int
    var body: some View {
        VStack{
            
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 16,
                              weight: .medium))
            
            Image(systemName: image)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .scaledToFit()
                .frame(width: 40,
                       height: 40)
            
            Text("\(temprature)°")
                .foregroundColor(.white)
                .font(.system(size: 28,
                              weight: .medium))
            
            
            
            
        }
        
    }
}

struct BackgroundColor: View {
    
     var isNight: Bool
    
    var body: some View {
       
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
        
    }
}


struct MainCityName: View {
    
    var cityName: String
    
    var body: some View{
        
        Text(cityName)
            .font(.system(size: 30,
                          weight: .medium,
                          design: .default))
            .foregroundColor(.white)
            .padding(25)
        
    }
}


struct mainWeatherInfo: View {
    
    var isNight: Bool
    var tempratureNumber: Int
    var body: some View{
        
        VStack (spacing: 8){
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 180.0, height: 180.0)
              
            
            Text("\(tempratureNumber)°")
                .font(.system(size: 70,
                            weight: .medium))
                .foregroundColor(.white)
        
    }
        .padding(.bottom, 40)
}
}

struct WeatherButton: View {
    
    var textOnButton: String
    var backColor: Color
    var frontColor: Color
    
    
    var body: some View {
        
            Text(textOnButton)
                .frame(width: 280, height: 50)
                .background(backColor)
                .foregroundColor(frontColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
           
        }
    }

