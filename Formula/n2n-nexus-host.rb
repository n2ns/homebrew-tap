class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code and Codex conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.9.1.tar.gz"
  version "0.9.1"
  sha256 "f5b4a303e8ce6b1fee8ae635a95f9bb0ab42cc5fb7078e999b0658f99eb3cc40"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
