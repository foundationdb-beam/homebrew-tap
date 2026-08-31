# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.0/efsql-0.1.0-macos-arm64.tar.gz"
      sha256 "d3cea6e12c3107a411e1c197c990c898f4cdf0ae223e2e31a6a1a99f892241f0"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.0/efsql-0.1.0-macos-x86_64.tar.gz"
      sha256 "0ee2cc756d92c791367309df5f910eb2b4070d76414693a105d6d4d24a4cda89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.0/efsql-0.1.0-linux-aarch64.tar.gz"
      sha256 "5d4f9bbc098839692b8108160c584f2fd8d96999c9322758d6344b5c96119567"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.0/efsql-0.1.0-linux-x86_64.tar.gz"
      sha256 "2a3a6b9a4c0a519d518d797df21b937a2c1e64312f6ee4f5604fdbbfcc56a1f7"
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
