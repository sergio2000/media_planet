//
//  ActorDetails.swift
//  Media_Planet
//
//  Created by Sergio Acosta on 1/22/23.
//

import SwiftUI

struct ActorDetails: View {
    let actor: String
    var body: some View {
        Text(actor)
    }
}
struct ActorDetails_Previews: PreviewProvider {
    static var previews: some View {
        ActorDetails(actor: "name")
    }
}
