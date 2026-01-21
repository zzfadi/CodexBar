import CodexBarCore
import SwiftUI

/// Embedded view for CodexBar within NotchFlow.
/// This provides a simplified view of AI provider usage metrics.
@MainActor
public struct CodexBarEmbeddedView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Image(systemName: "chart.bar.fill")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.cyan)
                Text("CodexBar")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("AI Usage Tracking")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            Divider()
                .background(Color.white.opacity(0.1))

            // Provider list placeholder
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(UsageProvider.allCases, id: \.rawValue) { provider in
                        ProviderRowView(provider: provider)
                    }
                }
                .padding(12)
            }
        }
        .background(Color.black.opacity(0.3))
    }
}

/// Simplified provider row for the embedded view
@MainActor
struct ProviderRowView: View {
    let provider: UsageProvider

    var body: some View {
        HStack(spacing: 12) {
            // Provider icon placeholder
            Circle()
                .fill(providerColor)
                .frame(width: 24, height: 24)
                .overlay(
                    Text(String(provider.rawValue.prefix(1)).uppercased())
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading, spacing: 2) {
                Text(provider.rawValue)
                    .font(.system(size: 12, weight: .medium))
                Text("Usage data loading...")
                    .font(.system(size: 10))
                    .foregroundColor(.secondary)
            }

            Spacer()

            // Usage bar placeholder
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.white.opacity(0.1))
                    RoundedRectangle(cornerRadius: 2)
                        .fill(providerColor.opacity(0.6))
                        .frame(width: geo.size.width * 0.3)
                }
            }
            .frame(width: 60, height: 6)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.05))
        )
    }

    private var providerColor: Color {
        // Map providers to colors
        switch provider {
        case .claude: return .orange
        case .codex: return .green
        case .cursor: return .purple
        case .copilot: return .blue
        case .gemini: return .cyan
        default: return .gray
        }
    }
}

#Preview {
    CodexBarEmbeddedView()
        .frame(width: 500, height: 450)
        .background(Color.black)
}
