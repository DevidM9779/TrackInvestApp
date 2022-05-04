//
//  SettingsView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/28/22.
//

import SwiftUI

struct SettingsView: View {
    @State var showMenu = false
    
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -50 {
                    self.menuClose()
                }
            }
       
        return GeometryReader { geometry in
            ZStack (alignment: .leading) {
                SettingsView()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(Animation.easeIn(duration: 0.2))
                
                Spacer()
            }
        }
        .background(Color.gray.opacity(0.3))
        .opacity(self.isOpen ? 1.0 : 0.0)
        .animation(Animation.easeIn(duration: 0.2))
        .gesture(drag)
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
