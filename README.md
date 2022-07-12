## Swift Coordinator

## Manually
Add `NavigationModifier.swift` and `SwiftUICoordinator.swift` to your project.

# Usage

Setup Coordinator Class
---------
```swift
class HomeCoordinator: ObservableObject, SwiftUICoordinator {
    @Published var popToRootView: Bool?
    
    @Published var firstViewCoordinator: FirstViewCoordinator?
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        $popToRootView
            .sink { [weak self] shouldPop in
                guard let `self` = self else {return}
                if shouldPop ?? true {
                    self.popToRoot()
                }
            }
            .store(in: &cancellables)
    }
    
    private func popToRoot() {
        firstViewCoordinator = nil
    }
    
    func openView<T>(coordinator: T) where T : ObservableObject {
        if let viewModel = coordinator as? FirstViewCoordinator {
            firstViewCoordinator = viewModel
        }
    }
    
    func closeView<T>(coordinator: T) where T : ObservableObject {
        if coordinator is FirstViewCoordinator {
            firstViewCoordinator = nil
        }
    }
    
}
```

Add navigation destination to the View.
---------
```swift
NavigationView {
  homeView()
      .navigation(item: $homeCoordinator.firstViewCoordinator) { coordinator in
          FirstView(firstViewCoordinator: coordinator)
        }
}.environmentObject(homeCoordinator)
```

Fire trigger to navigate.
---------
```swift
Button(action: {
    homeCoordinator.openView(coordinator: FirstViewCoordinator(coordinator: homeCoordinator))
  }, label: {
       Text("Navigate")
        .frame(width: 150, height: 150)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(10)
})
```
