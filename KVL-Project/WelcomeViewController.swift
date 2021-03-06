//
//  ViewController.swift
//  KVL-Project
//
//  Created by Edward O'Neill on 4/7/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureForWelcomeLabelObservation()
        configureForIconNameObservation()
    }
    
    private func configureForWelcomeLabelObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let newSize = change.newValue else { return }
            let fontSize = CGFloat(newSize)
            self?.welcomeLabel.font = self?.welcomeLabel.font.withSize(fontSize)
        })
    }
    
    private func configureForIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            guard let iconName = change.newValue else { return }
            self?.iconImageView.image = UIImage(systemName: iconName)
        })
    }


}

