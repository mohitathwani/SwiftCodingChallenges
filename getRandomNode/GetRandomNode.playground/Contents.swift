class BinarySearchTreeNode: CustomStringConvertible {
  public private(set) var value: Int
  var left: BinarySearchTreeNode?
  var right: BinarySearchTreeNode?
  var parent:BinarySearchTreeNode?
  
  var leftCount = 0
  var rightCount = 0
  
  var description: String {
    return "Value: \(value); leftCount: \(leftCount); rightCount: \(rightCount)"
  }
  
  init(value: Int) {
    self.value = value
  }
  
}

class BinarySearchTree {
  private var root: BinarySearchTreeNode?
  
  init(rootValue value: Int) {
    root = BinarySearchTreeNode(value: value)
  }
  
  public func insert(value: Int) {
    guard let tempRoot = self.root else {
      self.root = BinarySearchTreeNode(value: value)
      return
    }
    
    func recursiveInsert(root: BinarySearchTreeNode?) {
      guard let root = root else {
        return
      }
      
      if value <= root.value && root.left == nil {
        root.left = BinarySearchTreeNode(value: value)
        root.left?.parent = root
      }
      else if value > root.value && root.right == nil {
        root.right = BinarySearchTreeNode(value: value)
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
    func dfs(root: BinarySearchTreeNode?) {
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
    return findNode(value: value) == nil ? false : true
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
  
  private func getRandomNode(from root: BinarySearchTreeNode?) -> Int? {
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
  
  private func findNode(value: Int) -> BinarySearchTreeNode? {
    guard let root = root else {
      return nil
    }
    
    var q = [BinarySearchTreeNode]()
    q.append(root)
    
    while !q.isEmpty {
      let first = q.remove(at: 0)
      if first.value == value {
        return first
      }
      
      if let left = first.left {
        q.append(left)
      }
      
      if let right = first.right {
        q.append(right)
      }
    }
    return nil
  }
  
  private func treeMinimum(node: BinarySearchTreeNode) -> BinarySearchTreeNode? {
    var temp = node
    while temp.left != nil {
      temp = temp.left!
    }
    return temp
  }
  
  private func transplant(node: BinarySearchTreeNode?, over nodeToDelete: BinarySearchTreeNode) {
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
  
  private func updateChildrenCount(for root: BinarySearchTreeNode?) {
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

let tree = BinarySearchTree(rootValue: 5)
tree.insert(value: 3)
tree.insert(value: 2)
tree.insert(value: 1)
tree.insert(value: 4)
tree.insert(value: 6)
tree.insert(value: 7)
//tree.print()
//tree.find(value: 3)
//tree.find(value: 0)
//tree.delete(value: 3)
//tree.print()
tree.getRandomNode()
