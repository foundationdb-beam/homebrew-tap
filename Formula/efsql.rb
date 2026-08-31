# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.1/efsql-0.1.1-macos-arm64.tar.gz"
      sha256 "963d985a71386cb0ef19c181ee61a5a3b59524d6b0dd1aca18fb13bca33aab1b"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.1/efsql-0.1.1-macos-x86_64.tar.gz"
      sha256 "6ad9c8ec531bb9346c36a8d29e91d454625599ce0391dd30eaff176a8dc399de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.1/efsql-0.1.1-linux-aarch64.tar.gz"
      sha256 "cda0e2d1207e6cb4adc848ad9ff89568071e2388aea16f5a8eaf1e754352a41d"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.1/efsql-0.1.1-linux-x86_64.tar.gz"
      sha256 "46cc94f3df93eab5c8394f48424aa71f2a02a685cfd662737c995394525ddcb2"
    end
  end

  def install
    # The tarball holds a self-contained Erlang release (it bundles ERTS), so
    # it goes in libexec whole. bin/efsql resolves symlinks to locate the
    # release root, so a plain symlink is enough.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/efsql"
  end

  def caveats
    <<~EOS
      efsql needs the FoundationDB client library (libfdb_c), which Homebrew
      does not package. Install the FoundationDB client for your platform:

        https://github.com/apple/foundationdb/releases

      Then verify the install with:

        efsql --check
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/efsql --version")
  end
end
