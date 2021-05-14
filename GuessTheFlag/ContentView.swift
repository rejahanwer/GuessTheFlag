//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Rejah Anuvar on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var isShowingAlert = false
    
    var body: some View {
        ZStack(alignment: .center) {
            //LinearGradient(gradient: Gradient(colors: [.red, .gray]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(gradient: Gradient(colors: [.red, .black]),
                           center: .center,
                           startRadius: 10,
                           endRadius: 500)

            VStack(alignment: .center) {

                Button(action: {
                    self.isShowingAlert = true
                }) {
                    HStack {
                        Image(systemName: "pencil").renderingMode(.original)
                        Text("Edit")
                    }
                }
                .alert(isPresented: $isShowingAlert, content: {
                    Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
                })
                
                HStack() {
                    Text("Hello, ")
                    Text("world!")
                    Text("Ahoy!")
                }.padding().background(Color.green)
                
                HStack() {
                    Text("Hello, ")
                    Text("world!")
                    Text("Ahoy!")
                }.padding().background(Color.green)
                
                HStack() {
                    Text("Hello, ")
                    Text("world!")
                    Text("Ahoy!")
                }.padding().background(Color.green)
            }
        }.background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
