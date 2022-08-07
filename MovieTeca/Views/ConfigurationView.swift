//
//  ConfigurationView.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 07/08/22.
//

import SwiftUI

struct ConfigurationView: View {
    @EnvironmentObject var csManger:ColorSchemeManager
    var body: some View {
        VStack {
            Picker("", selection: $csManger.colorScheme) {
                Text("Light").tag(ColorScheme.light)
                Text("Dark").tag(ColorScheme.dark)
                Text("System").tag(ColorScheme.unspecified)
            }
            .pickerStyle(.segmented)
            .padding(.vertical, 60)
            Spacer()
        }
        .navigationTitle("Configuartion")
    }
}

enum modeScheme {
    case unspecified, light, dark
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
            .environmentObject(ColorSchemeManager())
    }
}
