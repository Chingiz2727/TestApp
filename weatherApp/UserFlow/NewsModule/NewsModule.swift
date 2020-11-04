protocol NewsModule: Presentable {
  typealias SelectArticle = (Article) -> Void
  
  var selectArticle: SelectArticle? { get set }
}
