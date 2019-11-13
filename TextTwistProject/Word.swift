import Foundation



struct Word {
    let unscrambled: String

    var scrambled: String {
        return String(unscrambled.shuffled())
    }
    
    static func getRandomWord() -> Word {
        return [
            Word(unscrambled: "conned"),
            Word(unscrambled: "hushes"),
            Word(unscrambled: "handed"),
            Word(unscrambled: "basket"),
            Word(unscrambled: "buzzer"),
            Word(unscrambled: "jumped"),
            Word(unscrambled: "fixing")
        ].randomElement()!
    }
    
     func userGuess(guess: String) -> String  {
        var response = ""
        if guess == Word.getRandomWord().scrambled {
            response = "correct"
        } else {
           response = "no"
        }
        return response
    }
}
