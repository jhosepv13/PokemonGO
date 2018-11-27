//
//  PokePin.swift
//  PokemonGO
//
//  Created by Jhosep Bazan on 21/11/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PokePin : NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var pokemon : Pokemon
    init(coord: CLLocationCoordinate2D, pokemon:Pokemon){
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
