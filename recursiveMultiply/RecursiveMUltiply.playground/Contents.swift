func recursiveMultiply(a: Int, b: Int) -> Int {
  var small = (a > b) ? b : a
  var big = (a == small) ? b : a
  
  if small == 0 {
    return 0
  }
  
  if small == 1 {
    return big
  }
  
  if small & 1 == 0 { //even
    let x = small >> 1
    let halfResult = recursiveMultiply(a: x, b: big)
    return halfResult + halfResult
  }
  
  let evenHalfResult = recursiveMultiply(a: small - 1, b: big)
  return evenHalfResult + big
}

recursiveMultiply(a: 0, b: 5)
recursiveMultiply(a: 1, b: 3)
recursiveMultiply(a: 5, b: 7)
recursiveMultiply(a: 31, b: 35)
recursiveMultiply(a: 1003, b: 567)
