//
//  ContentView.swift
//  Sesame
//
//  Created by Chamomile on 21/08/22.
//

import SwiftUI

struct ContentView: View {
    
    private enum Field: Int, CaseIterable {
        case ๐ช, password
    }

    @FocusState private var focusedField: Field?
    
    @State private var ๐ช = ""
    @State private var ๐งถ = "??"
    
    var body: some View {
        ZStack {
            VStack {
                TextField("%", text: $๐ช)
                    .focused($focusedField, equals: .๐ช)
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
                        + Text("\(๐งถ)")
                        + Text(" votes!")
                            .foregroundColor(.secondary)
                    }
                        .font(Font.custom("Arial Rounded MT Bold", size: 30))
                        .padding()
                    
                    Button {
                        ๐งถ = find(๐ช: Double(๐ช) ?? 101)
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
    
    func find(๐ช: Double) -> String {
        let ๐บ = round(๐ช) / 100.0
        
        if ๐บ == 1 || ๐บ == 0 {
            return "1"
        }
        
        for ๐งต in 2...100 {
            for ๐ชก in 1..<๐งต {
                let double๐ชก = Double(๐ชก)
                let double๐งต = Double(๐งต)
                
                let ๐งถ = round(double๐ชก/double๐งต * 100) / 100.0
                
                if ๐งถ == ๐บ {
                    return String(๐งต)
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
