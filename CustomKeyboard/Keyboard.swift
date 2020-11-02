//
//  Keyboard.swift
//  keyboard
//
//  Created by Jorge Raul Ovalle Zuleta on 7/26/15.
//  Copyright (c) 2015 j0rgitoPr0ductions. All rights reserved.
//

import UIKit

class Keyboard: UIView {
    @IBOutlet weak var shift: UIButton!
    @IBOutlet weak var numeric: UIButton!
    @IBOutlet weak var space: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var globe: UIButton!
    @IBOutlet var specials: [UIButton]!
    @IBOutlet var letters: [UIButton]!
}
