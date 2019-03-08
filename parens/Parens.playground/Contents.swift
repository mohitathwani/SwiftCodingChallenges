func parens(num: Int) {
  guard num != 0 else {
    return
  }
  
  var results = [Character]()
  func generate(numOpen: Int, numClose: Int) {
    if numOpen < num {
      results.append("(")
      generate(numOpen: numOpen + 1, numClose: numClose)
      results.popLast()
    }
    
    if numClose < numOpen {
      results.append(")")
      generate(numOpen: numOpen, numClose: numClose + 1)
      results.popLast()
    }
    
    if numClose == numOpen && numOpen == num {
      print(String(results))
    }
  }
  
  generate(numOpen: 0, numClose: 0)
}

parens(num: 3)
