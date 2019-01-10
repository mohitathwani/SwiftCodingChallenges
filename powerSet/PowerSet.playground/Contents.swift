func powerSet(arr:[Int]) -> [[Int]] {
  var arrCopy = arr
  var result = [[Int]]()
  
  if arr.isEmpty {
    result.append([Int]())
    return result
  }
  
  let last = arrCopy.removeLast()
  let subResults = powerSet(arr: arrCopy)
  print(subResults)
  result.append(contentsOf: subResults)
  
  for set in subResults {
    var x = set
    x.append(last)
    result.append(x)
  }
  return result
  
}

print(powerSet(arr: [1,2,3]))
