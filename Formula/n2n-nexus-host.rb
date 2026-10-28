class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code and Codex conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.10.0.tar.gz"
  version "0.10.0"
  sha256 "c0b56dc0ae3cd51e561b4966dbec4c260503123f12fc761096173d0e0652bb17"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
