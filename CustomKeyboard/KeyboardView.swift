//
//  KeyboardView.swift
//  keyboard
//
//  Created by Jorge Ovalle on 02/11/20.
//

import UIKit

protocol KeyboardViewDelegate: AnyObject {
    func didTapKey(_ key: Key)
}

final class KeyboardView: UIView {

    var isUpperCase: Bool = false
    var isShowingNumbers: Bool = false

    @IBOutlet var symbols: [UIButton]! {
        didSet {
            symbols.forEach { symbolKey in
                symbolKey.addTarget(self, action: #selector(didTapOnKey(_:)), for: .touchUpInside)
                let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongTapOnKey(_:)))
                gesture.minimumPressDuration = 0.3
                symbolKey.addGestureRecognizer(gesture)
            }
        }
    }

    @IBOutlet var letters: [UIButton]! {
        didSet {
            letters.forEach { letter in
                letter.addTarget(self, action: #selector(didTapOnKey(_:)), for: .touchUpInside)
            }
        }
    }

    // swiftlint:disable:next line_length
    private let alterMap =  ["=": "0", "{": "1", "[": "2", "(": "3", "/": "4", "&": "5", "<": "6", "+": "7", "*": "8", "\"": "9", "0": "=", "1": "{", "2": "[", "3": "(", "4": "/", "5": "&", "6": "<", "7": "+", "8": "*", "9": "\""]

    // swiftlint:disable:next line_length
    private let symbolsMap =  ["=": "_", "{": "}", "[": "]", "(": ")", "/": "\\", "&": "|", "<": ">", "+": "-", "*": "^", "\"": "'", ".": ":", ",": ";", "?": "!"]

    weak var delegate: KeyboardViewDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        backgroundColor = .gray5
    }

    @objc private func didTapOnKey(_ sender: UIButton) {
        delegate?.didTapKey(.letter(sender.currentTitle ?? ""))
    }

    @objc private func didLongTapOnKey(_ sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began,
           let buttonTitle = (sender.view as? UIButton)?.currentTitle {
            let alter = symbolsMap[buttonTitle] ?? ""
            delegate?.didTapKey(.letter(alter))
        }
    }

    @IBAction func didTapReturn(_ sender: Any) {
        delegate?.didTapKey(.action(.return))
    }

    @IBAction func didTapNextKeyboard(_ sender: Any) {
        delegate?.didTapKey(.action(.next))
    }

    @IBAction func didTapSwitchSymbols(_ sender: UIButton) {
        for symbol in symbols {
            guard let title = alterMap[symbol.currentTitle ?? ""] else { continue }
            let newTitle = title
            symbol.setTitle(newTitle, for: .normal)
        }
        if isShowingNumbers {
            sender.setTitle("123", for: .normal)
        } else {
            sender.setTitle("{[(", for: .normal)
        }
        isShowingNumbers.toggle()
    }

    @IBAction func didTapShift(_ sender: UIButton) {
        if isUpperCase {
            for letter in letters {
                letter.setTitle(letter.currentTitle?.lowercased(), for: .normal)
            }
            sender.backgroundColor = .gray1
            sender.tintColor = .magenta
        } else {
            for letter in letters {
                letter.setTitle(letter.currentTitle?.uppercased(), for: .normal)
            }
            sender.backgroundColor = .magenta
            sender.tintColor = .gray5
        }
        isUpperCase.toggle()
    }

    @IBAction func didTapBackSpace(_ sender: Any) {
        delegate?.didTapKey(.action(.backspace))
    }

}

enum Key {
    case letter(String)
    case action(ActionKey)
}

enum ActionKey {
    case backspace
    case `return`
    case next
}

extension UIColor {
    static var magenta = UIColor(hue: 0.98, saturation: 0.72, brightness: 0.87, alpha: 1)
    static var gray1 = UIColor.white.withAlphaComponent(0.08)
    static var gray5 = UIColor(hue: 0, saturation: 0, brightness: 0.13, alpha: 1)
}
