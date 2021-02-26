//
//  QuoteList.swift
//  Motivate
//
//  Created by T1001 on 2021-02-26.
//

import Foundation

struct Quote {
    let text: String
    var keywords: [String] = []
}

class Quotes {

    private static let quoteList: [Quote] = [
        Quote(text: "Age is an issue of mind over matter. If you don't mind, it doesn't matter."),
        Quote(text: "Anyone who stops learning is old, whether at twenty or eighty. Anyone who keeps learning stays young. The greatest thing in life is to keep your mind young."),
        Quote(text: "Wrinkles should merely indicate where smiles have been."),
        Quote(text: "True terror is to wake up one morning and discover that your high school class is running the country."),
        Quote(text: "A diplomat is a man who always remembers a woman's birthday but never remembers her age."),
        Quote(text: "As I grow older, I pay less attention to what men say. I just watch what they do."),
        Quote(text: "An archaeologist is the best husband a woman can have. The older she gets the more interested he is in her.")
    ]
    
    private static let quoteFonts: [FontName] = [
        .architect, .akaya, .dancingScript, .fjalla, .longCang
    ]
    
    static func randomQuoteText() -> String {
        quoteList.randomElement()!.text
    }
    
    static func randomFont() -> FontName {
        let a = quoteFonts.randomElement()!
        print(a)
        return a
    }
}
