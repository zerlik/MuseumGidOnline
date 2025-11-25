//
//  Combine+UITextField..swift
//  MuseumGidOnline
//
//  Created by andrew on 25.11.25.
//

import UIKit
import Combine

extension UITextField {
    func textPublisher() -> AnyPublisher<String?, Never> {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
    
    func beginEditingPublisher() -> AnyPublisher<String?, Never> {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidBeginEditingNotification, object: self)
            .map { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
    
    func endEditingPublisher() -> AnyPublisher<String?, Never> {
        NotificationCenter
            .default
            .publisher(for: UITextField.textDidEndEditingNotification, object: self)
            .map { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
}
