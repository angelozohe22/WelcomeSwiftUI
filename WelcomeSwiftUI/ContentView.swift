//
//  ContentView.swift
//  WelcomeSwiftUI
//
//  Created by Luis Angel Inga Mendoza on 28/01/23.
//

import SwiftUI

struct ContentView: View {
    
    private let number: String = "+51990098622"
    private let message: String = "Hello!"
    
    var body: some View {
        ZStack {
            Color.cyan.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack() {
                    Image("image")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Luis Angel")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                        Text("iOS Developer")
                            .font(.title3)
                            .foregroundColor(.white)
                            .italic()
                    }
                }
                
                HStack {
                    Button {
                        sendCall()
                    } label: {
                        Image(systemName: "phone.fill")
                            .modifier(ButtonModifier(color: .blue))
                    }
                    
                    Button {
                        sendMessage()
                    } label: {
                        Image(systemName: "message.fill")
                            .modifier(ButtonModifier(color: .red))
                            
                    }
                }
                
            }
        }
    }
    
    private func sendMessage() {
        let message = "sms:\(number)&body=\(message)"
        guard let stringMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        UIApplication.shared.open(URL(string: stringMessage)!, options: [:], completionHandler: nil)
    }
    
    private func sendCall() {
        guard let url = URL(string: "tel://\(number)") else { return }
        UIApplication.shared.open(url)
    }
    
}

struct ButtonModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
