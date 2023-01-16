class Microk8s < Formula
  include Language::Python::Virtualenv

  desc "Small, fast, single-package Kubernetes for developers, IoT and edge"
  homepage "https://microk8s.io/"
  url "https://github.com/ubuntu/microk8s/archive/installer-v2.2.0.tar.gz"
  sha256 "3e3d1ea62d97e94a76ad555281b160815f3a492f0d7b3f0c014c898cc252d22a"

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
