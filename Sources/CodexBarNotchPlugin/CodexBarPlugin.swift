import CodexBarCore
import SwiftUI

/// MiniAppPlugin protocol conformance for NotchFlow integration.
/// This allows CodexBar to be embedded as a mini app in NotchFlow's notch UI.
@MainActor
public struct CodexBarPlugin: Sendable {
    public let id = "codexBar"
    public let displayName = "CodexBar"
    public let icon = "chart.bar.fill"
    public let description = "AI usage tracking across providers"

    public init() {}

    public var preferredSize: CGSize {
        CGSize(width: 500, height: 450)
    }

    public var accentColor: Color? {
        Color.cyan
    }

    @ViewBuilder
    public func makeView() -> some View {
        CodexBarEmbeddedView()
    }
}
