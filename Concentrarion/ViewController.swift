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
    @IBOutlet weak var themeTextField: UITextField!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    //Game items
    
    var game: Concentration!
    var themePicker: ThemePicker!
    var themesProvider: ThemesProvider!
    var emojiService: EmojiService!
    
    // On CLICK

    @IBAction func onClickStartNewGameBtn(_ sender: Any) {
        resetGame(withName: themeTextField.text ?? ThemesProvider.defaultThemeName)
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
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
        let theme = themesProvider.provide(forName: ThemesProvider.defaultThemeName)
        emojiService = EmojiService(with: theme)
        resetGame(withName: ThemesProvider.defaultThemeName)
    }
    
    // L
    func resetGame(withName name: String) {
        let theme = themesProvider.provide(forName: name)
        emojiService.reset(for: theme)
        game.resetGame(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        updateViewFromModel()
        themeTextField.text = name
        print("Mew game started with name \(theme.title)")
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(game.score)"
    }

    func updateViewFromModel()  {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiService.emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
        }
        updateScoreLabel()
    }
    
    func showGameResults() {
        if game.isGameOver {

            let dialogMessage = UIAlertController(title: "Game is over", message: "Your score is \(game.score).", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                self.resetGame(withName: self.themeTextField.text ?? ThemesProvider.defaultThemeName)
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

