class Microk8s < Formula
  include Language::Python::Virtualenv

  desc "Small, fast, single-package Kubernetes for developers, IoT and edge"
  homepage "https://microk8s.io/"
  url "https://github.com/canonical/microk8s/archive/refs/tags/installer-v2.3.1.tar.gz"
  sha256 "928e5b3bdee513e0ac4e24f09dec1bbf0b084dcbc6bd54289450066bfd2defed"

  depends_on :macos => :sierra
  depends_on "python"
  depends_on "kubernetes-cli"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install File.open(buildpath/"installer"/"requirements.txt").read
    venv.pip_install_and_link buildpath/"installer"
  end

  def caveats
    <<~EOF
      Run `microk8s install` to start with MicroK8s
    EOF
  end

  test do
    system "#{bin}/microk8s", "uninstall"
  end
end
