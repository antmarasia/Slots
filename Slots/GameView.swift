//
//  ContentView.swift
//  Slots
//
//  Created by Anthony Marasia on 4/26/21.
//

import SwiftUI

struct GameView: View {
    
    @State var credits = 1000
    let images = ["apple", "cherry", "star"]
    
    @State var slot1 = "apple"
    @State var slot2 = "apple"
    @State var slot3 = "apple"
    
    var body: some View {
        VStack {
            Text("Slots!")
                .font(.largeTitle)
                .padding(.top, 20)
            Spacer()
            Text("Credits: \(credits)")
            Spacer()
            HStack {
                Spacer()
                Image(slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
            Button("Spin") {
                if credits <= 0 {
                    return
                }
                
                spin()
                
                checkScore()
            }
            .frame(width: 100.0, height: 40.0)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(50)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .font(Font.title2.weight(.medium))
            Spacer()
        }
    }
    
    private func getRandomNum() -> Int {
        return Int.random(in: 0...2)
    }
    
    private func spin() {
        let rand1 = getRandomNum()
        let rand2 = getRandomNum()
        let rand3 = getRandomNum()
        
        slot1 = images[rand1]
        slot2 = images[rand2]
        slot3 = images[rand3]
    }
    
    private func checkScore() {
        if slot1 == slot2 && slot1 == slot3 {
            credits += 5
        } else {
            credits -= 5
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
