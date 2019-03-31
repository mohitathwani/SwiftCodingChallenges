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
