//
//  RowView.swift
//  Rancher Pro
//
//  Created by Sawyer Cherry on 11/30/21.
//

import SwiftUI

struct RowView: View {
    //: MARK: - Properties
    var title: String
    var body: some View {
       
            HStack {
                Text(title)
                Spacer()
                Image(systemName: "arrow.right")
            }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "stinky")
    }
}

