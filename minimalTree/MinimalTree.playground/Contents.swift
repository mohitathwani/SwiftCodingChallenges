let arr = [1,2,3,4,5,6,7,8,9,10]

class Node {
  var value = 0
  var left: Node? = nil
  var right: Node? =  nil
}

func buildTree(arr: [Int]) -> Node? {
  
  func buildTree(arr: [Int], start: Int, end: Int) -> Node? {
    
    if end < start {
      return nil
    }
    
    let mid = start + ((end - start) / 2)
    let node = Node()
    node.value = arr[mid]
    node.left = buildTree(arr: arr, start: start, end: mid - 1)
    node.right = buildTree(arr: arr, start: mid + 1, end: end)
    return node
  }
  
  return buildTree(arr: arr, start: 0, end: arr.count - 1)
}

func traverse(node: Node?) {
  if node == nil {
    return
  }
  
  traverse(node: node?.left)
  print(node?.value)
  traverse(node: node?.right)
}

let root = buildTree(arr: arr)

traverse(node: root)
