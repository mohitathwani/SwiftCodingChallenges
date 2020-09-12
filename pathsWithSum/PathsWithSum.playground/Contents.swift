class BinarySearchTree {
  private(set) var root: Node?
  
  
  init(rootValue value: Int) {
    root = Node(value: value)
  }
  
  public func insert(value: Int) {
    guard let tempRoot = self.root else {
      self.root = Node(value: value)
      return
    }
    
    func recursiveInsert(root: Node?) {
      guard let root = root else {
        return
      }
      
      if value <= root.value && root.left == nil {
        root.left = Node(value: value)
        root.left?.parent = root
      }
      else if value > root.value && root.right == nil {
        root.right = Node(value: value)
        root.right?.parent = root
      }
      else if value <= root.value {
        recursiveInsert(root: root.left)
      }
      else {
        recursiveInsert(root: root.right)
      }
      
      if let left = root.left {
        root.leftCount = left.leftCount + left.rightCount + 1
      }
      
      if let right = root.right {
        root.rightCount = right.leftCount + right.rightCount + 1
      }
    }
    
    recursiveInsert(root: tempRoot)
  }
  
  public func print() {
    func dfs(root: Node?) {
      guard let root = root else {
        return
      }
      
      dfs(root: root.left)
      Swift.print(root)
      dfs(root: root.right)
    }
    
    dfs(root: root)
  }
  
  public func find(value: Int) -> Bool {
    return !(findNode(value: value) == nil)
  }
  
  public func delete(value: Int) {
    guard let nodeToDelete = findNode(value: value) else {
      return
    }
    
    if nodeToDelete.left == nil {
      transplant(node: nodeToDelete.right, over: nodeToDelete)
    }
    else if (nodeToDelete.right == nil) {
      transplant(node: nodeToDelete.left, over: nodeToDelete)
    }
    else {
      guard let successorNode = treeMinimum(node: nodeToDelete.right!) else {
        fatalError()
      }
      
      if let successorParent = successorNode.parent, successorParent !== nodeToDelete {
        transplant(node: successorNode.right, over: successorNode)
        successorNode.right = nodeToDelete.right
        successorNode.right?.parent = successorNode
      }
      transplant(node: successorNode, over: nodeToDelete)
      successorNode.left = nodeToDelete.left
      successorNode.left?.parent = successorNode
    }
    
    updateChildrenCount(for: root)
  }
  
  public func getRandomNode() -> Int? {
    guard let root = root else {
      return nil
    }
    
    return getRandomNode(from: root)
  }
  
  private func getRandomNode(from root: Node?) -> Int? {
    guard let root = root else {
      return nil
    }
    
    let totalCount = root.leftCount + root.rightCount
    guard totalCount != 0 else {
      return root.value
    }
    
    let random = Int.random(in: 0..<totalCount)
    if random < root.leftCount {
      return getRandomNode(from: root.left)
    }
    else if random == root.leftCount {
      return root.value
    }
    else {
      return getRandomNode(from: root.right)
    }
  }
  
  private func findNode(value: Int) -> Node? {
    var tempNode = root
    
    while tempNode != nil {
      if tempNode!.value == value  {
        return tempNode
      }
      
      if value < tempNode!.value {
        tempNode = tempNode!.left
      } else {
        tempNode = tempNode!.right
      }
    }
    return nil
  }
  
  private func treeMinimum(node: Node) -> Node? {
    var temp = node
    while temp.left != nil {
      temp = temp.left!
    }
    return temp
  }
  
  private func transplant(node: Node?, over nodeToDelete: Node) {
    if nodeToDelete.parent == nil {
      self.root = node
    }
    else if nodeToDelete === nodeToDelete.parent?.left {
      nodeToDelete.parent?.left = node
    }
    else {
      nodeToDelete.parent?.right = node
    }
    
    if node != nil {
      node?.parent = nodeToDelete.parent
    }
  }
  
  private func updateChildrenCount(for root: Node?) {
    guard let root = root else {
      return
    }
    
    if root.left == nil && root.right == nil {
      return
    }
    
    updateChildrenCount(for: root.left)
    updateChildrenCount(for: root.right)
    
    if let left = root.left {
      root.leftCount = left.leftCount + left.rightCount + 1
    }
    
    if let right = root.right {
      root.rightCount = right.leftCount + right.rightCount + 1
    }
  }
}

extension BinarySearchTree {
  class Node: CustomStringConvertible {
    public private(set) var value: Int
    var left: Node?
    var right: Node?
    weak var parent:Node?
    
    var leftCount = 0
    var rightCount = 0
    
    var description: String {
      return "Value: \(value); leftCount: \(leftCount); rightCount: \(rightCount)"
    }
    
    init(value: Int) {
      self.value = value
    }
    
    deinit {
      Swift.print("Deleting: ", self)
    }
  }
}

var tree: BinarySearchTree? = BinarySearchTree(rootValue: 5)
tree!.insert(value: 3)
tree!.insert(value: 2)
tree!.insert(value: 1)
tree!.insert(value: 4)
tree!.insert(value: 6)
tree!.insert(value: 7)

func pathsWithSum(tree: BinarySearchTree, targetSum: Int) -> Int {
  var freqMap = [Int:Int]()
  var totalPaths = 0
  var runningSum = 0
  
  func compute(node: BinarySearchTree.Node?) {
    guard let node = node else {
      return
    }
    runningSum += node.value
    let difference = runningSum - targetSum

    if let freq = freqMap[difference] {
      totalPaths = freq
    }
    
    if runningSum == targetSum {
      totalPaths += 1
    }
    
    if let freq = freqMap[runningSum] {
      freqMap[runningSum] = freq + 1
    }
    totalPaths += compute(node: <#T##BinarySearchTree.Node?#>)
    
    
  }
  compute(node: tree.root)
  
  return totalPaths
}


