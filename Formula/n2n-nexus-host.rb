class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code, Codex and pi conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.14.0.tar.gz"
  version "0.14.0"
  sha256 "b6f8834b2fa1505bc8bae88ad5affbeb530ca41a51ca1ff0604520124fce0678"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
