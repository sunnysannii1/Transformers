//
//  Router.swift
//  Transformers
//
//  Created by Ahsan Ali on 28/04/2021.
//

import UIKit
protocol Router {
   func route(
      to routeID: String,
      from context: UIViewController,
      parameters: Transformer?
   )
}
