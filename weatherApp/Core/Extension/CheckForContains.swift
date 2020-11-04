extension Array where Element: Equatable {
  func contains(array: [Element]) -> Bool {
    for item in array {
      if !self.contains(item) { return false }
    }
    return true
  }
}
