//
// BenchHR
//
// Created by ahmed moharam.

#if canImport(SwiftUI)

    import SwiftUI

    @available(iOS 13.0, *)
    public extension UIView {
        convenience init<Body>(content: Body) where Body: View {
            let hostingView = UIHostingController(rootView: content).view!
            self.init(frame: hostingView.frame)

            hostingView.add(to: self)
                .backgroundColor(.clear)
                .fillSuperview()
        }

        convenience init<Body>(content: () -> Body) where Body: View {
            self.init(content: content())
        }
    }

    @available(iOS 13.0, *)
    public extension View {
        func hostInUIView() -> UIView {
            UIView(content: self)
        }
    }

#endif
