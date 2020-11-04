protocol AppCoordinator: Coordinator {}

final class AppCoordinatorImpl: BaseCoordinator, AppCoordinator {
  override func start() {
    startNews()
  }
  
  private func startMainPage() {
    let module = assembler.resolver.resolve(MainPageModule.self)!
    router.setRootModule(module)
  }
  
  private func startNews() {
    var news = assembler.resolver.resolve(NewsModule.self)!
    news.selectArticle = { [weak self] article in
      self?.showArticle(article: article)
    }
    router.setRootModule(news)
  }
  
  private func showArticle(article: Article) {
    let module = assembler.resolver.resolve(NewsDetailModule.self, argument: article)
    router.present(module)
  }
}
