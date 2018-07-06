//https://leetcode.com/problems/word-search-ii/description/
//Given a 2D board and a list of words from the dictionary, find all words in the board.
//
//Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
//
//Example:
//
//Input:
//words = ["oath","pea","eat","rain"] and board =
//[
//['o','a','a','n'],
//['e','t','a','e'],
//['i','h','k','r'],
//['i','f','l','v']
//]
//
//Output: ["eat","oath"]
//Note:
//You may assume that all inputs are consist of lowercase letters a-z.

func dfs(i: Int, j: Int, node: TrieNode, map:inout [[Bool]], board:[[Character]], results: inout Set<String>) {
  let topRow = i - 1
  let bottomRow = i + 1
  let leftColumn = j - 1
  let rightColumn = j + 1
  
  let numRows = board.count
  let numCols = board[0].count

  if let word = node.word {
    results.insert(word)
  }
  
  if topRow >= 0 && !map[topRow][j] && node[board[topRow][j]] != nil {
    map[topRow][j] = true
    dfs(i: topRow, j: j, node: node[board[topRow][j]]!, map: &map, board: board, results: &results)
    map[topRow][j] = false
  }
  
  if bottomRow < numRows && !map[bottomRow][j] && node[board[bottomRow][j]] != nil {
    map[bottomRow][j] = true
    dfs(i: bottomRow, j: j, node: node[board[bottomRow][j]]!, map: &map, board: board, results: &results)
    map[bottomRow][j] = false
  }
  
  if leftColumn >= 0 && !map[i][leftColumn] && node[board[i][leftColumn]] != nil {
    map[i][leftColumn] = true
    dfs(i: i, j: leftColumn, node: node[board[i][leftColumn]]!, map: &map, board: board, results: &results)
    map[i][leftColumn] = false
  }
  
  if rightColumn < numCols && !map[i][rightColumn] && node[board[i][rightColumn]] != nil {
    map[i][rightColumn] = true
    dfs(i: i, j: rightColumn, node: node[board[i][rightColumn]]!, map: &map, board: board, results: &results)
    map[i][rightColumn] = false
  }
}

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
  
  if board.isEmpty || words.isEmpty {
    return [String]()
  }
  
  var results = Set<String>()
  let root = generateTrie(words: words)
  var map = board.map { (row) -> [Bool] in
    row.map({ (c) -> Bool in
      return false
    })
  }
  
  let numRows = board.count
  let numCols = board[0].count
  
  for i in stride(from: 0, to: numRows, by: 1) {
    for j in stride(from: 0, to: numCols, by: 1) {
      if root[board[i][j]] != nil {
//        print(board[i][j])
        dfs(i: i, j: j, node: root[board[i][j]]!, map: &map, board: board, results: &results)
//        if let str = string {
//          result.append(str)
//        }
      }
    }
  }
  
  return Array(results).sorted()
}

func generateTrie(words: [String]) -> TrieNode {
  let root = TrieNode()
  
  for word in words {
    var temp = root
    for (i,c) in word.enumerated() {
      if temp[c] == nil {
        temp[c] = TrieNode()
      }
      if i == word.count - 1 {
        temp[c]?.word = word
      }
      temp = temp[c]!
    }
  }
  
  return root
}

class TrieNode {
  var children = [Character:TrieNode]()
  var word: String?
  
  subscript(child: Character) -> TrieNode? {
    get {
      return children[child]
    }
    set {
      children[child] = newValue
    }
    
  }
}

//findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["l","f","l","v"]], ["oath","pea","eat","rain", "oat", "lie"])

findWords([["a", "a"]], ["aaa"])
