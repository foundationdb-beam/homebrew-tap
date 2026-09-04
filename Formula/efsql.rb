# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.5/efsql-0.1.5-macos-arm64.tar.gz"
      sha256 "b81adbf9b1ab139c10ad4af1ef8e45a057b50478d5565b50729b4b3e3da4fc1f"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.5/efsql-0.1.5-macos-x86_64.tar.gz"
      sha256 "c288af59746c74ca3dd5105e6cc8e50160c8c514d643b1ced4bca2a8462f5e3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.5/efsql-0.1.5-linux-aarch64.tar.gz"
      sha256 "2f551c08c3399adef4738764503f5dca0e413aa897b9e88e7ef17dcdda0d5e3e"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.5/efsql-0.1.5-linux-x86_64.tar.gz"
      sha256 "0c49d82e493b2089280139b48d2d2ddf5df6d29d4ff5ac2426e049f4801804d7"
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
