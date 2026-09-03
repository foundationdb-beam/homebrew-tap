# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.3/efsql-0.1.3-macos-arm64.tar.gz"
      sha256 "50db6452a22384b774e637b7c42ec9541c8e9da31b9f62b280be0799557164e9"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.3/efsql-0.1.3-macos-x86_64.tar.gz"
      sha256 "9d2f35a5f82d9a9d707c3b0231c0147d9c88ca5ebc1c10d6e60f3cf32f6287ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.3/efsql-0.1.3-linux-aarch64.tar.gz"
      sha256 "51a6b51cd955a26beb2f946687441c08cf5f6c38e302858c9a925523ac9c7396"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.3/efsql-0.1.3-linux-x86_64.tar.gz"
      sha256 "64af197c7a8e689915df9dd2376b28cf9a758f65d8172697d38c72f1d8f419f2"
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
