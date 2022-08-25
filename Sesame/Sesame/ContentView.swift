//
//  ContentView.swift
//  Sesame
//
//  Created by Chamomile on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    
    private enum Field: Int, CaseIterable {
        case 🪑, password
    }

    @FocusState private var focusedField: Field?
    
    @State private var 🪑 = ""
    @State private var 🧶 = "??"
    
    var body: some View {
        ZStack {
            VStack {
                TextField("%", text: $🪑)
                    .focused($focusedField, equals: .🪑)
                    .padding()
                    .font(Font.custom("Arial Rounded MT Bold", size: 30))
                    .frame(width: 90)
                    .fixedSize()
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(.black.opacity(0.7), lineWidth: 4)
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            Button {
                                focusedField = nil
                            } label: {
                                Text("Done")
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                
                HStack {
                    Group {
                        Text("At least ")
                            .foregroundColor(.secondary)
                        + Text("\(🧶)")
                        + Text(" votes!")
                            .foregroundColor(.secondary)
                    }
                        .font(Font.custom("Arial Rounded MT Bold", size: 30))
                        .padding()
                    
                    Button {
                        🧶 = find(🪑: Double(🪑) ?? 101)
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .foregroundColor(.primary)
                            .font(.largeTitle)
                    }
                }
            }
            
            VStack {
                Spacer()
                
                Text("Enter a percentage to find the minimum amount of votes in a poll with this value")
                    .foregroundColor(.secondary)
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .frame(width: 350)
                    .padding(.vertical)
            }
        }
        .preferredColorScheme(.light)
    }
    
    func find(🪑: Double) -> String {
        let 💺 = round(🪑) / 100.0
        
        if 💺 == 1 || 💺 == 0 {
            return "1"
        }
        
        for 🧵 in 2...100 {
            for 🪡 in 1..<🧵 {
                let double🪡 = Double(🪡)
                let double🧵 = Double(🧵)
                
                let 🧶 = round(double🪡/double🧵 * 100) / 100.0
                
                if 🧶 == 💺 {
                    return String(🧵)
                }
            }
        }
        
        return "??"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
