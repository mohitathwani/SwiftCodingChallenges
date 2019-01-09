//-40 -20 -1 1 2 3 5 7 9 12 13
//  0   1  2 3 4 5 6 7 8 9  10
//               ^

func magicIndex(arr: [Int]) -> Int {
  guard !arr.isEmpty else {
    return Int.min
  }
  
  var start = 0
  var end = arr.count - 1
  
  while (start <= end) {
    let mid = start + ((end - start) / 2)
    if arr[mid] == mid {
      return mid
    }
    else if arr[mid] < mid {
      start = mid + 1
    }
    else {
      end = mid - 1
    }
  }
  
  return Int.min
}

func magicIndexWithRepeatingNumbers(arr: [Int]) -> Int{
  
  guard !arr.isEmpty else {
    return Int.min
  }
  
  var start = 0
  var end = arr.count - 1
  
  while start <= end {
    let mid = start + (end - start) / 2
    if arr[mid] == mid {
      return mid
    }
    
    else if arr[mid] < mid {
      start = max(arr[mid], mid + 1)
    }
    else {
      end = min(arr[mid], mid - 1)
    }
  }
  return Int.min
}

func recursiveMagicIndexWithRepeating(arr: [Int]) -> [Int] {
  guard !arr.isEmpty else {
    return [Int]()
  }
  
  var result = [Int]()
  
  func recurse(start: Int, end: Int) {
    guard start >= 0 && start < arr.count && end >= 0 && end < arr.count && start <= end else {
      return
    }

    let mid = start + (end - start) / 2
    if arr[mid] == mid {
      result.append(mid)
    }
    
    //left of mid
    recurse(start: start, end: min(mid - 1, arr[mid]))
    
    //right of mid
    recurse(start: max(mid + 1, arr[mid]), end: end)

  }
  
  recurse(start: 0, end: arr.count - 1)
  return result
}

magicIndex(arr: [-40,-20,-1,1,2,3,5,7,9,12,13])
magicIndexWithRepeatingNumbers(arr: [-10,-5,2,2,2,3,4,7,9,12,13])
recursiveMagicIndexWithRepeating(arr: [-10,-5,2,2,2,3,4,7,9,12,13])
recursiveMagicIndexWithRepeating(arr: [-40,-20,-1,1,2,3,5,7,9,12,13])
