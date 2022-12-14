//
//  WelcomeViewController.swift
//  mvkuznetsov_3PW2
//
//  Created by Максим Кузнецов on 07.10.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private var commentView = UIView()
    
    private var commentLabel = UILabel()
    private let valueLabel = UILabel()
    
    private let incrementButton = UIButton()
    
    private var value: Int = 0
    
    private func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        return button
    }
    
    private func setupMenuButtons() {
        let colorsButton = makeMenuButton(title: "🎨")
        let notesButton = makeMenuButton(title: "📝")
        let newsButton = makeMenuButton(title: "📰")
        
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        
        self.view.addSubview(buttonsSV)
        buttonsSV.pin(to: self.view, [.left: 24, .right: 24, .bottom: 24])
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        self.view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenterX(to: self.view.centerXAnchor)
    }
    
    @discardableResult
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 12
        
        self.view.addSubview(commentView)
        commentView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        commentView.pin(to: self.view, [.left: 24, .right: 24])
        
        commentLabel.font = .systemFont(ofSize: 18.0, weight: .regular)
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 2
        commentLabel.textAlignment = .center
        commentLabel.text = "0"
        
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        
        return commentView
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        incrementButton.backgroundColor = .white
        incrementButton.layer.appplyShadow()
        
        self.view.addSubview(incrementButton)
        incrementButton.setHeight(100);
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pin(to: self.view, [.left: 24, .right: 24])
        
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func incrementButtonPressed() {
        value += 1
        incrementButton.isEnabled = false;
        incrementButton.layer.changeShadow()
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        UIView.transition(with: commentView, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.updateUI()
        }) { completion in
            self.incrementButton.isEnabled = true
            self.incrementButton.layer.appplyShadow()
        }
    }
    
    func updateUI() {
        updateValueLabel()
        updateCommentLabel()
    }
    
    func updateValueLabel() {
        valueLabel.text = "\(value)"
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        setupMenuButtons()
        setupIncrementButton()
        setupValueLabel()
        commentView = setupCommentView()
    }
    
    func updateCommentLabel() {
        switch value {
        case 0...10:
            commentLabel.text = "1"
        case 10...20:
            commentLabel.text = "2"
        case 20...30:
            commentLabel.text = "3"
        case 30...40:
            commentLabel.text = "4"
        case 40...50:
            commentLabel.text = "! ! ! ! ! ! ! ! ! "
        case 50...60:
            commentLabel.text = "big boy"
        case 60...70:
            commentLabel.text = "70 70 70 moreeeee"
        case 70...80:
            commentLabel.text = "⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ "
        case 80...90:
            commentLabel.text = "80+\n go higher!"
        case 90...100:
            commentLabel.text = "100!! to the moon!!"
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
