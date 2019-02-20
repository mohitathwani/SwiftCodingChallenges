extension String {
  func toCharArray() -> [Character] {
    return Array(self)
  }
}

func permutationsWithDups(str: String) -> [String] {
  var freqMap = [Character:Int]()
  
  func generateFreqMap() {
    for c in str {
      if var count = freqMap[c] {
        count += 1
        freqMap[c] = count
      }
      else {
        freqMap[c] = 1
      }
    }
  }
  generateFreqMap()
  
  var generatorVector = [Character]()
  var result = [String]()
  
  func permutation(depth: Int) {
    if freqMap.isEmpty {
      return
    }
    
    for(key, value) in freqMap {
      if value == 0 {
        continue
      }
      
      generatorVector.append(key)
      freqMap[key] = value - 1
      permutation(depth: depth + 1)
      generatorVector.popLast()
      freqMap[key] = value
    }
    
    
    if depth == str.count {
      result.append(String(generatorVector))
    }
  }
  
  permutation(depth: 0)
  return result
}

print(permutationsWithDups(str: "abbc"))
