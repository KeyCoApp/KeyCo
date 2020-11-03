//
//  UINib+instance.swift
//  CustomKeyboard
//
//  Created by Jorge Ovalle on 02/11/20.
//

import UIKit

extension UINib {

    static func newInstance<T>(of type: T.Type) -> T {
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        guard let view = objects.first as? T else {
            fatalError("Could'n decode instance")
        }
        return view
    }

}
