struct Box: CustomStringConvertible {
  let width: Int
  let height: Int
  let length: Int
  
  var description: String {
    return "{\(width), \(height), \(length)}"
  }
  
  func canGoOnTop(of box: Box) -> Bool {
    if width < box.width && length < box.length && height < box.height {
      return true
    }
    return false
  }
  
  
}

func computeMaxHeight(boxes: [Box]) -> Int {
  let sortedBoxes = boxes.sorted { (b1, b2) -> Bool in
    return b1.height > b2.height
  }
  
  func calculate(boxes:[Box], base: Box?, baseIndex: Int) -> Int {
    if baseIndex >= boxes.count {
      return 0
    }
    
    var maxHeight = 0
    let nextBox = boxes[baseIndex]
    
    var heightWithNext = 0
    if base == nil || nextBox.canGoOnTop(of: base!) {
      heightWithNext = calculate(boxes: boxes, base: nextBox, baseIndex: baseIndex + 1)
      heightWithNext += nextBox.height
    }
    
    let heightWithoutNext = calculate(boxes: boxes, base: base, baseIndex: baseIndex + 1)
    
    maxHeight = max(heightWithNext, heightWithoutNext)
    return maxHeight
  }
  
  return calculate(boxes: sortedBoxes, base: nil, baseIndex: 0)
}

let box1 = Box(width: 1, height: 1, length: 1)
let box2 = Box(width: 2, height: 5, length: 2)
let box3 = Box(width: 3, height: 3, length: 3)

computeMaxHeight(boxes: [box1, box2, box3])
