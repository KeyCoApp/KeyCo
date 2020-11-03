import UIKit

final class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let inputView = inputView else { return }

        let keyboard = UINib.newInstance(of: KeyboardView.self)
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.delegate = self
        inputView.addSubview(keyboard)

        NSLayoutConstraint.activate([
            keyboard.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            keyboard.topAnchor.constraint(equalTo: inputView.topAnchor),
            keyboard.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            keyboard.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
        ])
    }

}

extension KeyboardViewController: KeyboardViewDelegate {

    func didTapKey(_ key: Key) {
        switch key {
        case .action(let action):
            switch action {
            case .next:
                advanceToNextInputMode()
            case .backspace:
                textDocumentProxy.deleteBackward()
            case .return:
                textDocumentProxy.insertText("\n")
            }
        case .letter(let letter):
            textDocumentProxy.insertText(letter)
        }
    }

}
