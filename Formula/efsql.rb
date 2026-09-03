# Generated file. Rendered from .github/homebrew/efsql.rb.tmpl by the release
# workflow and pushed to the Homebrew tap; edit the template, not this copy.
class Efsql < Formula
  desc "SQL frontend and data explorer for FoundationDB"
  homepage "https://github.com/foundationdb-beam/efsql"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.2/efsql-0.1.2-macos-arm64.tar.gz"
      sha256 "2e4a9bb9e57cb5bade751b52245d51a880d5b3aa29aea13ce584d3340cbe382f"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.2/efsql-0.1.2-macos-x86_64.tar.gz"
      sha256 "722a3b25ae14e071f19cffb428ca7e501875ef51cfc68232a0d95cf71474068d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.2/efsql-0.1.2-linux-aarch64.tar.gz"
      sha256 "5bd2c8a507e354d7f6b69f668de24d9174b0a9233fe206fb55d4fc410a887243"
    end
    on_intel do
      url "https://github.com/foundationdb-beam/efsql/releases/download/v0.1.2/efsql-0.1.2-linux-x86_64.tar.gz"
      sha256 "a425e5dfff5eb2e3c2160ff8dbea28674e303b0fae13c66b73ba769ad6d66d94"
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
