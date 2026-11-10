class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code and Codex conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.12.6.tar.gz"
  version "0.12.6"
  sha256 "fabd018c2dd2a9d8b8a391d0b960901fd83e3db165c19950a6650edd039c1eaf"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
