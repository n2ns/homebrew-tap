class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code and Codex conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.12.1.tar.gz"
  version "0.12.1"
  sha256 "47de273a19b2072ba0e525b9645ce4b56d16e3f4a9398ea5c649fc83105e23ea"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
