//
//  ContentView.swift
//  Shared
//
//  Created by Edwin Torres on 1/24/21.
//

import SwiftUI

enum ClaculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, convenience
    case eqwuals, plus, minus, multiply, divide
    case C
}

struct ContentView: View {
    
    let buttons: [[ClaculatorButton]] = [
        [.one, .two, .three, .plus]
    ]
    
    var body: some View {
        
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 12){
                
                HStack {
                    Spacer()
                    Text("42").foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
            
                ForEach(buttons, id: \.self) {row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            Text(button.rawValue)
                            .font(.system(size:32))
                            .frame(width: self.buttonWidth(), height: self.buttonWidth())
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .cornerRadius(self.buttonWidth())
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
