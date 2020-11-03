import Swinject

struct AppCoordinatorAssembly: Assembly {
  func assemble(container: Container) {
    container.register(AppCoordinator.self) { (resolver, parentAssembler: Assembler) in
      let assembler = Assembler(
        [MainPageModuleAssembly()],
        parent: parentAssembler
      )
      let coordinator = AppCoordinatorImpl(assembler: assembler, router: resolver.resolve(AppRouter.self)!)
      return coordinator
    }
  }
}
