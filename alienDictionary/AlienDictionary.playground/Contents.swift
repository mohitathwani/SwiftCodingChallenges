//https://leetcode.com/problems/alien-dictionary/
//There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.
//
//Example 1:
//
//Input:
//[
//  "wrt",
//  "wrf",
//  "er",
//  "ett",
//  "rftt"
//]
//
//Output: "wertf"
//Example 2:
//
//Input:
//[
//  "z",
//  "x"
//]
//
//Output: "zx"
//Example 3:
//
//Input:
//[
//  "z",
//  "x",
//  "z"
//]
//
//Output: ""
//
//Explanation: The order is invalid, so return "".
//Note:
//
//You may assume all letters are in lowercase.
//If the order is invalid, return an empty string.
//There may be multiple valid order of letters, return any one of them is fine.

class Graph {
  var adjList: [Character: Set<Character>]
  var inDegrees: [Character: Int]

  init?(list: [String]) {
    adjList = [Character: Set<Character>]()
    inDegrees = [Character: Int]()

    for word in list {
      for c in Array(word) {
        adjList[c] = Set<Character>()
        inDegrees[c] = 0
      }
    }

    for i in stride(from: 0, to: list.endIndex - 1, by: 1) {
      let a1 = Array(list[i])
      let a2 = Array(list[i + 1])

      if a1.count > a2.count &&
        a1.prefix(a2.count) == a2.prefix(a2.count) { //a2 is a prefix of a1
        return nil
      }

      for j in stride(from: 0, to: min(a1.count, a2.count), by: 1) {
        let c1 = a1[j]
        let c2 = a2[j]

        if c1 != c2 {
          if !adjList[c1]!.contains(c2) {
            adjList[c1]!.insert(c2)
            inDegrees[c2]! += 1
          }
          break
        }
      }
    }
  }

  func getTopologicalOrder() -> String {
    var processing = Array(inDegrees.filter { $0.value == 0 }.keys)

    var result = ""

    while !processing.isEmpty {
      let node = processing.removeFirst()
      result.append(node)

      let neighbors = adjList[node] ?? Set<Character>()
      for neighbor in neighbors {
        inDegrees[neighbor]! -= 1
        if inDegrees[neighbor]! == 0 {
          processing.append(neighbor)
        }
      }
    }
    return result.count == inDegrees.count ? result : ""
  }
}

class Solution {
  func alienOrder(_ words: [String]) -> String {
    guard let g = Graph(list: words) else {
      return ""
    }
    return g.getTopologicalOrder()
  }
}

let s = Solution()
s.alienOrder(["wrt", "wrf", "er", "ett", "rftt"])
s.alienOrder(["z", "x"])
s.alienOrder(["z", "x", "z"])
s.alienOrder(["z", "z"])
s.alienOrder(["za", "zb", "ca", "cb"])
s.alienOrder(["abc", "ab"])
