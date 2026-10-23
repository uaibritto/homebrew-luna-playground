cask "luna" do
  version "0.3.0"
  sha256 "af4b0b9c4e92a24e550f8af78366e6ab92d8c0dc8a8353713a44ffe7992f45ee"

  url "https://github.com/uaibritto/homebrew-luna/releases/download/v#{version}/Luna-#{version}.dmg"
  name "Luna"
  desc "Roda JavaScript e TypeScript na hora"
  homepage "https://uaibritto.github.io/homebrew-luna/"

  livecheck do
    url "https://uaibritto.github.io/homebrew-luna/appcast.xml"
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

  caveats <<~EOS
    O Luna mudou de tap. Para continuar pelo tap novo:
      brew untap --force uaibritto/luna-playground
      brew install --cask uaibritto/luna/luna
  EOS
end
