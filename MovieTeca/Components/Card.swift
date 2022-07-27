//
//  Card.swift
//  MovieTeca
//
//  Created by Kike Hernandez D. on 26/07/22.
//

import SwiftUI

struct Card: View {
    let width: Int; let height: Int; let padding: Int; let color: Color
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: CGFloat(width), height: CGFloat(height))
            .cornerRadius(20)
            .padding(.horizontal, CGFloat(padding))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(width: 240, height: 350, padding: 15, color: .indigo).previewLayout(.fixed(width: 240, height: 350))
    }
}
