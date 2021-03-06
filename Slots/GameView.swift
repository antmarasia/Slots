//
//  ContentView.swift
//  Slots
//
//  Created by Anthony Marasia on 4/26/21.
//

import SwiftUI
import ConfettiSwiftUI

struct GameView: View {
    
    @ObservedObject var slotViewModel = SlotViewModel()
    
    var body: some View {
        VStack {
            Text("Slots!")
                .font(.largeTitle)
                .padding(.top, 20)
            Spacer()
            ZStack {
                Text("Credits: \(slotViewModel.credits)")
                ConfettiCannon(counter: $slotViewModel.winCount)
            }
            Spacer()
            HStack {
                Spacer()
                Image(slotViewModel.slot1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slotViewModel.slot2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Image(slotViewModel.slot3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Spacer()
            Button("Spin") {
                slotViewModel.spin()
            }
            .frame(width: 150.0, height: 60.0)
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(50)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .font(Font.title2.weight(.medium))
            Spacer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
