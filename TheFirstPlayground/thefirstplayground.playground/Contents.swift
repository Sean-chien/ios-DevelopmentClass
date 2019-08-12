import UIKit

var str = "Hello, playground"
let constant = 10
var y = 10
var x = y + constant

var greating = "Hello"
var name = "Simon"
var message = greating + name
message.uppercased()
message.lowercased()
message.count

var bookPrice = 39
var numOfcopies = 5
var totalOfPrice = bookPrice * numOfcopies
// var totalPricesMessage = "The price of the book is $" + String(totalOfPrice)
var totalPricesMessage = "The price of the book is $ \(totalOfPrice)"

var timeYouWakeUp = 6
if timeYouWakeUp == 6 {
    print("Cook youself a big breakfast!")
} else {
    print("Go out for breakfast!")
}

//var bonus = 5000
//
//if bonus >= 10000 {
//    print("I will travel to Paris and London!")
//} else if bonus >= 5000 && bonus < 10000 {
//    print("I will travel to Tokyo")
//} else if bonus >= 1000 && bonus < 5000 {
//    print("I will travel to Bangkok")
//} else {
//    print("Just stay home")
//}

var bonus = 5000
switch bonus {
case 10000...:
    print("I will travel to Paris and London!")
case 5000...9999:
    print("I will travel to Tokyo")
case 1000...4999:
    print("I will travel to Bangkok")
default:
    print("Just stay home")
}

var bookCollection = ["Tool of Tians", "Rework", "Your Move"]
print(bookCollection[0])
bookCollection.append("Authority")
bookCollection.remove(at: 1)

for index in 0...bookCollection.count - 1 {
    print(bookCollection[index])
}

var bookCollectionDict = ["1328683788": "Tool of Titans", "0307463745": "Rework", "1612060919": "Authority"]

for (key, value) in bookCollectionDict {
    print("ISBN: \(key)")
    print("Title: \(value)")
}

// control + command + space
var emojiDict: [String: String] = ["👻": "Ghost",
                                   "🤡": "Clown",
                                   "😡": "Angry",
                                   "😤": "Nerdy",
                                   "😱": "Scream",
                                   "👾": "Alien monster"]

var wordToLookUp = "😤"
var meaning = emojiDict[wordToLookUp]


let containerView = UIView(frame: CGRect(x: 0, y: 0, width:300, height:300))
containerView.backgroundColor = UIColor.orange
// show result -> click Quick Look
let emjiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
// UILabel -> Object
emjiLabel.text = wordToLookUp
emjiLabel.font = UIFont.systemFont(ofSize: 100.0)
containerView.addSubview(emjiLabel)


containerView.addSubview(emjiLabel)

let meaningLabel = UILabel(frame: CGRect(x: 110, y: 100, width: 150, height: 150))
meaningLabel.text = meaning
meaningLabel.font = UIFont.systemFont(ofSize: 30.0)
meaningLabel.textColor = UIColor.white

containerView.addSubview(meaningLabel)

