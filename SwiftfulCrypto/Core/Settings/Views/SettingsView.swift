//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/14/21.
//

import SwiftUI

struct SettingsView: View {
    
    let portfolioURL = URL(string: "https://www.skyler.media")!
    let placeholderURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                // background
                Color.theme.background
                    .ignoresSafeArea()
                
                // content
                List {
                    portfolioSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Information")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var portfolioSection: some View {
        Section(header: Text("Development & Portfolio")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by Skyler with a lot of hard work!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
                Divider()
                Spacer()
                Text("©2023 Skyler Media Co.")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit My Portfolio!", destination: portfolioURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data used in this app comes from a free API developed by CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: placeholderURL)
            Link("Privacy Policy", destination: placeholderURL)
        }
    }
    
    
}
