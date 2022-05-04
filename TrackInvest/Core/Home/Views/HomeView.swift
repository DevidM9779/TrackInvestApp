//
//  HomeView.swift
//  TrackInvest
//
//  Created by David Milan-Medina on 3/17/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var fm = FirestoreManager()
    @State private var addBtnView = false
    @State private var watchlistShowing = false
    @State private var showSideMenu = false
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                NavigationView {
                    VStack {
                        List {
                            ForEach(fm.portfolios, id:\.name) { portfolio in
                                
                                NavigationLink (destination: PortfolioView(portfolio: portfolio)){
                                    PortfolioButton(portfolio: portfolio)
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            .listRowSeparator(.hidden)
                            
                        }
                        .refreshable {
                            fm.getPortfolios()
                        }
                        .listStyle(.plain)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                topView
                            }
                        }
                        .padding(.top, 30)
                        
                        addBtnElement
                    }
                    
                }.onAppear() {
                    fm.getPortfolios()
                }
                
                
                
                GeometryReader { geometry in
                    SideMenu(width: geometry.size.width * 4/5,
                             isOpen: self.showSideMenu,
                             menuClose: {
                        self.showSideMenu.toggle()
                    })
                }
            }
        }
    }

}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView {
    private var topView : some View {
        HStack (alignment: .center) {
            // Settings button
            Button(action: {
                self.showSideMenu.toggle()
            }) {
                SettingsButton()
                    .padding(.top, 10)
                    .padding(.leading, 10)
            }
            Spacer()
            
            
            // Name of the view
            BigBoldTextView(text: "Portfolios")
                .padding(.top, 10)
            Spacer()
            
            
            // Watchlist button
            Button(action: {
                watchlistShowing = true
            }) {
                HeartButton()
                    .padding(.top, 10)
                    .padding(.trailing, 10)
            }.fullScreenCover(isPresented: $watchlistShowing, onDismiss: {}, content: {
                WatchlistView()
            })
        }
    }
    
    private var addBtnElement : some View {
        HStack {
            Button(action: {
                addBtnView = true
            }, label: {
                AddPortfolioBtn()
            })
            .sheet(isPresented: $addBtnView) {
                AddPortfolioView(alertIsVisible: $addBtnView)
            }
        }
        .frame(width: 150, height: 80)
        .padding(.top)
    }
}
