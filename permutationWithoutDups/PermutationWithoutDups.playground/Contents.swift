extension String {
  func toCharArray() -> [Character] {
    return Array(self)
  }
}

func permutationsWithoutDups(str: String) -> [String] {

  func permutation(characters:[Character]) -> [[Character]] {
    var characters = characters
    if characters.isEmpty {
      return [[Character]]()
    }
    
    if characters.count == 1 {
      return [characters]
    }
    
    let lastChar = characters.popLast()!
    let subResults = permutation(characters: characters)
    var results = [[Character]]()
    
    for subResult in subResults {
      for i in stride(from: 0, through: subResult.count, by: 1) {
        var temp = subResult
        temp.insert(lastChar, at: i)
        results.append(temp)
      }
    }
    return results
  }
  
  let results = permutation(characters: str.toCharArray())
  var output = [String]()
  for result in results {
    output.append(String(result))
  }
  
  return output
}

permutationsWithoutDups(str: "abcd").count
