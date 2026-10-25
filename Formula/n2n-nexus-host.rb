class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code and Codex conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.9.5.tar.gz"
  version "0.9.5"
  sha256 "2f09139ffa77f3f4fbdf6bfab48eb9f7d18a52198cd698f6ad1498376f91645b"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
