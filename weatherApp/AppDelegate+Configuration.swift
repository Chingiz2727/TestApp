import Swinject

extension AppDelegate {
  
  func makeCoordinator() -> Coordinator {
    let rootContainer = Container()
    rootContainer.register(AppRouter.self) { [unowned self] _ in
      return AppRouterImpl(window: self.window)
    }
    let rootAssembler = Assembler(
      [
        ServiceAssembly(),
        AppCoordinatorAssembly(),
      ],
      container: rootContainer
    )
    let coordinator = rootAssembler.resolver.resolve(AppCoordinator.self, argument: rootAssembler)!
    return coordinator
  }
}
