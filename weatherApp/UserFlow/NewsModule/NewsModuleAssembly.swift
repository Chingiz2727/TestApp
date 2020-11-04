import Swinject

struct NewsModuleAssembly: Assembly {
  func assemble(container: Container) {
    container.register(NewsModule.self) { (resolver) in
      return NewsViewController()
    }
  }
}
