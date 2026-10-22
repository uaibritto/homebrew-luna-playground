cask "luna" do
  version "0.1.0"
  sha256 "ded530a42ac1e4b6e08bd77331499a594ab40ad30af2a07aab368e43705db085"

  url "https://github.com/uaibritto/homebrew-luna-playground/releases/download/v#{version}/Luna-#{version}.dmg"
  name "Luna"
  desc "Playground nativo de JavaScript e TypeScript"
  homepage "https://uaibritto.github.io/homebrew-luna-playground/"

  livecheck do
    url "https://uaibritto.github.io/homebrew-luna-playground/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # O Sparkle atualiza o app sozinho (D27).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Luna.app"

  zap trash: [
    "~/Library/Application Support/Luna",
    "~/Library/Caches/Luna",
    "~/Library/Preferences/run.britto.luna.plist",
  ]
end
