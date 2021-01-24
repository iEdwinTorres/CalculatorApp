//
//  ContentView.swift
//  Shared
//
//  Created by Edwin Torres on 1/24/21.
//

import SwiftUI

enum ClaculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equals, plus, minus, multiply, divide
    case clear, space
    
    var title: String {
        switch self {
            case .zero: return "0"
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
            case .divide: return "÷"
            case .multiply: return "×"
            case .minus: return "-"
            case .plus: return "+"
            case .decimal: return "."
            case .equals: return "="
            case .space: return ""
            default:  return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal: return Color(.darkGray)
            case .clear: return Color(.lightGray)
            case .space: return Color(.black)
            default: return .orange
        }
    }
    
}

struct ContentView: View {
    
    let buttons: [[ClaculatorButton]] = [
        [.clear, .space, .divide, .multiply],
        [.seven, .eight, .nine, .minus],
        [.four, .five, .six, .plus],
        [.one, .two, .three, .equals],
        [.zero, .decimal]
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
                            Text(button.title)
                            .font(.system(size:32))
                                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                            .foregroundColor(.white)
                                .background(button.backgroundColor)
                            .cornerRadius(self.buttonWidth(button: button))
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(button: ClaculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        
        if button == .equals {
            return (UIScreen.main.bounds.width - 4 * 12) / 4 * 2
        }
        
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
