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
    
    lazy var game = Concentration(numberOfPairsOfCars: (cardButtons.count + 1)/2)
    var themePicker: ThemePicker!
    let themesProvider = ThemesProvider()

    var cardEmojies = Dictionary<Int, String>()
    var availableEmojies: Array<String>!
    
    // On CLICK

    @IBAction func onClickStartNewGameBtn(_ sender: Any) {
        resetGame(withName: themeTextField.text ?? "other")
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker = ThemePicker(textField: themeTextField)
        resetGame(withName: "other")
    }
    func resetGame(withName name: String) {
        let theme = themesProvider.provide(forName: name)
        availableEmojies = theme?.emojiList
        game = Concentration(numberOfPairsOfCars: (cardButtons.count + 1)/2)
        updateViewFromModel()
        updateScoreLabel()
        themeTextField.text = name
        print("Mew game started with name \(theme?.title ?? "unknown")")
    }
    func updateScoreLabel() {
        scoreLabel.text = "Score: \(game.score)"
    }

    func updateViewFromModel()  {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
        }
        updateScoreLabel()
    }
    
    func emoji(for card:Card) -> String {
        if cardEmojies[card.id] == nil, availableEmojies.count > 0  {
            let number = Int(arc4random_uniform(UInt32(availableEmojies.count)))
            cardEmojies[card.id] = availableEmojies.remove(at: number)
        }
        print("For card '\(card.id)' added emoji '\(cardEmojies[card.id]!)'")
        return cardEmojies[card.id] ?? "?"
        
        /*
         
         if let emoji = cardEmojies[card.id] {
            return emoji
         } else {
            return "?"
         }
         
         OR
         
         if cardEmojies[card.id] != nil {
            return cardEmojies[card.id]!
         } else {
            return "?"
         }
         
         */
    }
    
    func showGameResults() {
        print("here \(game.isGameOver)")
        if game.isGameOver {

            let dialogMessage = UIAlertController(title: "Game is over", message: "Your score is \(game.score).", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                self.resetGame(withName: self.themeTextField.text ?? "other")
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

