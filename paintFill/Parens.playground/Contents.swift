struct Point {
  let i: Int
  let j: Int
  
  func isValidFor(row: Int, column: Int) -> Bool {
    if i >= 0 && i < row && j >= 0 && j < column {
      return true
    }
    return false
  }
}

func paintFill(screen: inout [[Character]],
               point: Point,
               newColor: Character) {
  
  guard point.i < screen.count && point.j < screen[0].count else {
    return
  }
  
  if screen[point.i][point.j] == newColor {
    return
  }
  
  let rows = screen.count
  let columns = screen[0].count
  let originalColor = screen[point.i][point.j]
  screen[point.i][point.j] = newColor
  
  func fill(point: Point) {
    let leftPoint = Point(i: point.i, j: point.j - 1)
    let rightPoint = Point(i: point.i, j: point.j + 1)
    let topPoint = Point(i: point.i - 1, j: point.j)
    let bottomPoint = Point(i: point.i + 1, j: point.j)
    
    if leftPoint.isValidFor(row: rows, column: columns) &&
      screen[leftPoint.i][leftPoint.j] ==  originalColor{
      screen[leftPoint.i][leftPoint.j] = newColor
      fill(point: leftPoint)
    }
    
    if rightPoint.isValidFor(row: rows, column: columns) &&
      screen[rightPoint.i][rightPoint.j] == originalColor {
      screen[rightPoint.i][rightPoint.j] = newColor
      fill(point: rightPoint)
    }
    
    if topPoint.isValidFor(row: rows, column: columns) &&
      screen[topPoint.i][topPoint.j] == originalColor {
      screen[topPoint.i][topPoint.j] = newColor;
      fill(point: topPoint)
    }
    
    if bottomPoint.isValidFor(row: rows, column: columns) &&
      screen[bottomPoint.i][bottomPoint.j] == originalColor {
      screen[bottomPoint.i][bottomPoint.j] = newColor
      fill(point: bottomPoint)
    }
  }
  
  fill(point: point)
  
}

var screen:[[Character]] = [["R", "R", "G"],
              ["B", "R", "R"],
              ["B", "R", "B"]]

let point = Point(i: 5, j: 5)
paintFill(screen: &screen, point: point, newColor: "B")
print(screen)
