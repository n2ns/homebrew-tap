class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code, Codex and pi conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.14.1.tar.gz"
  version "0.14.1"
  sha256 "f46920d2430e25b9c4066a4cb463d9cc378430a84cacbe828ffba794805d2cae"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
