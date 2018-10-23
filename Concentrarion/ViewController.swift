//
//  ViewController.swift
//  Concentrarion
//
//  Created by Dmitrii Kupchenko on 06/10/2018.
//  Copyright © 2018 Dmitrii Kupchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //UI items
    @IBOutlet private weak var themeTextField: UITextField!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var scoreLabel: UILabel!
    
    //Game items
    
    private var game: Concentration!
    private var themePicker: ThemePicker!
    private var themesProvider: ThemesProvider!
    private var emojiService: EmojiService!
    
    // On CLICK

    @IBAction private func onClickStartNewGameBtn(_ sender: Any) {
        resetGame(withName: themeTextField.text ?? ThemesProvider.defaultTheme.title)
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        let theme = themesProvider.provide(forName: themeTextField.text ?? ThemesProvider.defaultTheme.title)
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel(currentTheme: theme)
            showGameResults()
        } else {
            print("Value is not set")
        }
    }
    
    // Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        themesProvider = ThemesProvider()
        themePicker = ThemePicker(textField: themeTextField)
        let theme = themesProvider.provide(forName: ThemesProvider.defaultTheme.title)
        emojiService = EmojiService(with: theme)
        resetGame(withName: ThemesProvider.defaultTheme.title)
    }
    
    // L
    private func resetGame(withName name: String) {
        let theme = themesProvider.provide(forName: name)
        emojiService.reset(for: theme)
        game.resetGame(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        updateViewFromModel(currentTheme: theme)
        themeTextField.text = name
        print("Mew game started with name \(theme.title)")
    }
    
    private func updateScoreLabel() {
        scoreLabel.text = "Score: \(game.score)"
    }

    private func updateViewFromModel(currentTheme: Theme)  {
        self.view.backgroundColor = currentTheme.themeColor.backgroundColor
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.card(for: index)
            if card.isFaceUp {
                button.setTitle(emojiService.emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = currentTheme.themeColor.choosedCardColor
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : currentTheme.themeColor.cardColor
            }
        }
        updateScoreLabel()
    }
    
    private func showGameResults() {
        if game.isGameOver {

            let dialogMessage = UIAlertController(title: "Game is over", message: "Your score is \(game.score).", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.resetGame(withName: self.themeTextField.text ?? ThemesProvider.defaultTheme.title)
            })
            
            dialogMessage.addAction(ok)
            
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }

}



//read about internal/external names


//underbar (underscore) is used to avoid using flipCard(withEmoji: "👻", on: sender)
// params like withemoji when calling method
//func example(emoji: String, _ button: UIButton) {
//
//}
//
//func exampleUsage(sender: UIButton) {
//    example(emoji: "asd", sender)
//}
////////////////////////////////////////

