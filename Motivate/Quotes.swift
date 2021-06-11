//
//  QuoteList.swift
//  Motivate
//
//  Created by T1001 on 2021-02-26.
//

import Foundation

struct Quote: Codable {
    let text: String
    var keywords: [Keyword]
}

class Quotes {

    static let quoteList: [Quote] = [
        Quote(text: "Age is an issue of mind over matter. If you don't mind, it doesn't matter.",
              keywords: [.hair, .beard, .laugh, .glasses]),
        Quote(text: "Bridges are perhaps the most invisible form of public architecture.",
              keywords: [.bridge]),
        Quote(text: "The friendship we share grows amidst the craggy rock pond reeds of water spray fireflies scented with bonfires.",
              keywords: [.bonfire, .fire]),
        Quote(text: "I knew I was an unwanted baby when I saw that my bath toys were a toaster and a radio.",
              keywords: [.toy]),
        Quote(text: "Whenever I fail as a father or husband... a toy and a diamond always works.",
              keywords: [.toy, .money]),
        Quote(text: "I'm the person who wouldn't send back my food even if I got steak when I'd ordered fish.",
              keywords: [.aquarium]),
        Quote(text: "I think we consider too much the good luck of the early bird and not enough the bad luck of the early worm.",
              keywords: [.bird]),
        Quote(text: "I'd rather learn from one bird how to sing than to teach ten thousand stars how not to dance.",
              keywords: [.bird]),
        Quote(text: "Just living is not enough. One must have sunshine, freedom, and a little flower.",
              keywords: [.petal, .sunglasses, .smile, .sunset]),
        Quote(text: "For happiness one needs security, but joy can spring like a flower even from the cliffs of despair.",
              keywords: [.petal, .smile]),
        Quote(text: "Every time I see an adult on a bicycle, I no longer despair for the future of the human race.",
              keywords: [.bicycle]),
        Quote(text: "Best therapist has four legs.",
              keywords: [.dog, .cat]),
        Quote(text: "Dogs and philosophers do the greatest good and get the fewest rewards.",
              keywords: [.dog]),
        Quote(text: "The only creatures that are evolved enough to convey pure love are dogs and infants.",
              keywords: [.dog]),
        Quote(text: "I love everything that's old, - old friends, old times, old manners, old books, old wine.",
              keywords: [.wine])
    ]
    
    private static let quoteFonts: [FontName] = [
        .architect, .akaya, .dancingScript, .fjalla, .longCang
    ]
    
    static func randomQuoteText() -> String {
        quoteList.randomElement()!.text
    }
    
    static func randomFont() -> FontName {
        quoteFonts.randomElement()!
    }
}

enum Keyword: String, Codable {
    case bonfire = "Bonfire" //
    case toy = "Toy" //
    case aquarium = "Aquarium" //
    case beard = "Beard" //
    case bridge = "Bridge" //
    case bird = "Bird" //
    case park = "Park"
    case petal = "Petal" //
    case sunglasses = "Sunglasses"
    case bicycle = "Bicycle" //
    case boat = "Boat"
    case smile = "Smile"
    case sunset = "Sunset"
    case bus = "Bus"
    case sky = "Sky"
    case rock = "Rock"
    case dress = "Dress"
    case eating = "Eating"
    case tower = "Tower"
    case junk = "Junk"
    case person = "Person"
    case playground = "Playground"
    case laugh = "Laugh" //
    case baloon = "Baloon"
    case computer = "Computer"
    case chair = "Chair"
    case clock = "Clock"
    case cat = "Cat"
    case mouth = "Mouth"
    case fire = "Fire"
    case coffee = "Coffee"
    case food = "Food"
    case fruit = "Fruit"
    case forest = "Forest"
    case hair = "Hair"
    case ice = "Ice"
    case money = "Money" //
    case moon = "Moon"
    case piano = "Piano"
    case sleep = "Sleep"
    case tattoo = "Tattoo"
    case cup = "Cup"
    case wine = "Wine" //
    case room = "Room"
    case beach = "Beach"
    case dog = "Dog" //
    case airplane = "Airplane"
    case cake = "Cake"
    case umbrella = "Umbrella"
    case glasses = "Glasses" //
    case pie = "Pie"
}
