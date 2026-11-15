class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code, Codex and pi conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.13.1.tar.gz"
  version "0.13.1"
  sha256 "fe40992ee292027fd61b4f3f14fd856b640e7428c85653ff728f3167d058066c"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
