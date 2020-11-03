protocol AppCoordinator: Coordinator {}

final class AppCoordinatorImpl: BaseCoordinator, AppCoordinator {
  override func start() {
    startMainPage()
  }
  
  private func startMainPage() {
    let module = assembler.resolver.resolve(MainPageModule.self)!
    router.setRootModule(module)
  }
}
