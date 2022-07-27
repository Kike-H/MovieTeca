//
//  SeccionTittle.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct SeccionTitle: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20))
                .frame(width: 160)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(5)
                .padding()
            Spacer()
        }
    }
}

struct SeccionTittle_Previews: PreviewProvider {
    static var previews: some View {
        SeccionTitle(title: "New Movies").previewLayout(.fixed(width: 165, height: 25))
    }
}
