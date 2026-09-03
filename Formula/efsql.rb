# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.4/efsql-0.1.4-macos-arm64.tar.gz"
      sha256 "5c68cf282bed3898b6170d25a1fee91baae526a35a5b9f7e7d786a8ac72b264f"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.4/efsql-0.1.4-macos-x86_64.tar.gz"
      sha256 "c69843c6cf73391eac5297e0ff07e044a27d61c2ba0af4f1956c84395ecf80ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.4/efsql-0.1.4-linux-aarch64.tar.gz"
      sha256 "6e5c70fbac5d9b98d1ab477bc8053b622f08e5f768bab2031cadfd20edb558aa"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.4/efsql-0.1.4-linux-x86_64.tar.gz"
      sha256 "1129b4bc4fcda94e7a0da74d51a319a07d2ff3e8bad3a9c950d3b8fc2acd6570"
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
