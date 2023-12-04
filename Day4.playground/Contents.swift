import Foundation

let fileURL = Bundle.main.url(forResource: "pileOfCards", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let list = content.split(separator: "\n")

func partOne() {
    var winningNumbers: [[String]] = []
    var playingNumbers: [[String]] = []
    var sum = 0
    for i in list {
        let firstSplit = i.description.components(separatedBy: ":")[1]
        let secoundSplit = firstSplit.components(separatedBy: "|")
        var winningList = secoundSplit[0].components(separatedBy: " ").filter { $0 != "" }
        var playingList = secoundSplit[1].components(separatedBy: " ").filter { $0 != "" }
        winningNumbers.append(winningList)
        playingNumbers.append(playingList)
    }
    for games in winningNumbers.indices {
        var returnValue = 0
        for num in winningNumbers[games] {
            if playingNumbers[games].contains(num) {
                if returnValue == 0 {
                    returnValue = 1
                } else {
                    returnValue = returnValue * 2
                }
            }
        }
        sum += returnValue
    }
    print(sum)
}

func partTwo() {
    
}

partOne()
