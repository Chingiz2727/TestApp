import Swinject

struct MainPageModuleAssembly: Assembly {
  func assemble(container: Container) {
    container.register(MainPageModule.self) { (resolver) in
      return MainPageViewController()
    }
  }
}
