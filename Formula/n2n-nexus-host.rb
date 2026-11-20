class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code, Codex and pi conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.13.4.tar.gz"
  version "0.13.4"
  sha256 "5262ddf35489c94bbd27b40885dd12c53f4ce32b52c0bcd995e47634b6820e25"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
