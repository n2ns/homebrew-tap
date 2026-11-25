class N2nNexusHost < Formula
  desc "Host of n2n-nexus: lets Claude Code, Codex and pi conversations find and message each other"
  homepage "https://github.com/n2ns/n2n-nexus"
  url "https://github.com/n2ns/n2n-nexus/archive/refs/tags/host-v0.15.0.tar.gz"
  version "0.15.0"
  sha256 "b5fc4821776b84d8c6c5ccfe2e42f0b2012226f33aaf0e760644d43d3f596986"
  license "Apache-2.0"

  option "with-nexus-recipe-319a62f91ec24b95177df9138e85f1c12cef0eca87fdaa552ca4d7d1ffd93a6d", "Require this release recipe during an automatic update"
  depends_on "go" => :build

  def install
    expected = ENV["N2N_NEXUS_BREW_RECIPE"]
    raise "The formula changed during the update" if expected && expected != "319a62f91ec24b95177df9138e85f1c12cef0eca87fdaa552ca4d7d1ffd93a6d"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./host/cmd/n2n-nexus-host"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/n2n-nexus-host version").strip
  end
end
