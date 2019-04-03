func canUse(denomination: Int, for num: Int) -> Bool {
  if num - denomination < 0 {
    return false
  }
  return true
}

func recursiveNumWays(denominations:[Int], num: Int) -> Int {
  var count = 0
  
  func recurse(denominations:[Int], num: Int) {
    if num == 0 {
      count = count + 1
      return
    }
    
    //This is so we avoid counting permutations as
    //different results. Basically pruning the tree.
    var usableDenominations = denominations
    for denomination in denominations {
      if canUse(denomination: denomination, for: num) {
        recurse(denominations: usableDenominations, num: num - denomination)
        usableDenominations.removeAll {$0 == denomination}
      }
      else {
        usableDenominations.removeAll {$0 == denomination}
      }
    }
  }
  
  recurse(denominations:denominations, num: num)
  return count
}

recursiveNumWays(denominations: [25,10,5,1], num: 98)

func dpCoins(denominations: [Int], num: Int) -> Int {
  let columns = num + 1
  let rows = denominations.count + 1
  
  var dpTable = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
  
  var denominations = denominations.sorted()
  if denominations[0] != 0 {
    denominations.insert(0, at: 0)
  }
  
  dpTable[0][0] = 1
  
  for i in 1..<rows {
    dpTable[i][0] = 1
  }
  
  for i in 1..<rows {
    for j in 1..<columns {
      if (j - denominations[i]) >= 0 {
        dpTable[i][j] = dpTable[i - 1][j] + dpTable[i][j - denominations[i]]
      } else {
        dpTable[i][j] = dpTable[i - 1][j]
      }
    }
  }
  return dpTable[rows - 1][columns - 1]
}

dpCoins(denominations: [25,10,5,1], num: 98)
