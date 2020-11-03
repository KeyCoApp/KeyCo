import UIKit

final class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.13, alpha: 1)

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

}
