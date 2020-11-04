import Swinject

struct NewsDetailModuleAssembly: Assembly {
  func assemble(container: Container) {
    container.register(NewsDetailModule.self) { (resolver, article: Article) in
      return NewsDetailViewController(article: article)
    }
  }
}
