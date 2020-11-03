//
//  KeyboardView.swift
//  keyboard
//
//  Created by Jorge Ovalle on 02/11/20.
//

import UIKit

protocol KeyboardViewDelegate: AnyObject {
    
}

final class KeyboardView: UIView {
    
    weak var delegate: KeyboardViewDelegate?
    
}
