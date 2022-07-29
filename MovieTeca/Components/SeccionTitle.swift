//
//  SeccionTittle.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct SeccionTitle: View {
    let title: String; let width: Int;
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .frame(width: CGFloat(width))
                .foregroundColor(.white)
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
            Spacer()
        }
    }
}

struct SeccionTittle_Previews: PreviewProvider {
    static var previews: some View {
        SeccionTitle(title: "New Movies", width: 160).previewLayout(.fixed(width: 165, height: 25))
    }
}
