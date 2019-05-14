func countEval(str: String, result: Bool) -> Int {
  if str.count == 0 {
    return 0
  }
  
  if str.count == 1 {
    if str == "0" && result == false {
      return 1
    }
    
    if str == "1" && result == true {
      return 1
    }
    return 0
  }
  
  var ways = 0
  for i in stride(from: 1, to: str.count, by: 2) {
    let left = String(str.prefix(i))
    let right = String(str.suffix(str.count - i - 1))
    let op = Array(str)[i]
    
    let leftTrue = countEval(str: left, result: true)
    let leftFalse = countEval(str: left, result: false)
    
    let rightTrue = countEval(str: right, result: true)
    let rightFalse = countEval(str: right, result: false)
    
    let total = (leftTrue + leftFalse) * (rightTrue + rightFalse)
    var totalTrue = 0
    if op == "&" {
      totalTrue = leftTrue * rightTrue
    }
    else if (op == "|") {
      totalTrue = (leftTrue * rightFalse) + (leftFalse * rightTrue) + (leftTrue * rightTrue)
    }
    else {
      totalTrue = (leftTrue * rightFalse) + (leftFalse * rightTrue)
    }
    
    let x = result == true ? totalTrue : total - totalTrue
    ways += x
  }
  
  return ways
}

//countEval(str: "1", result: true)
countEval(str: "1^0|0|1", result: false)
countEval(str: "0&0&0&1^1|0", result: true)
