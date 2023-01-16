class Microk8s < Formula
  include Language::Python::Virtualenv

  desc "Small, fast, single-package Kubernetes for developers, IoT and edge"
  homepage "https://microk8s.io/"
  url "https://github.com/ubuntu/microk8s/archive/installer-v2.3.0.tar.gz"
  sha256 "72f027a0ba5abe9af7dcb7ef4acef2215c8cbf22e19b0592f83194222ce87f78"

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
