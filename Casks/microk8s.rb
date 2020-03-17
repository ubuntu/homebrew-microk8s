cask 'microk8s' do
  version '1.0.0'
  sha256 'd5bc0ece595a0c262fa3590de70ff6353ebbd3ac753f511adef4db25a840246e'

  url 'https://github.com/ubuntu/homebrew-microk8s/releases/download/v#{version}/microk8s'
  appcast 'https://github.com/ubuntu/homebrew-microk8s/releases.atom'
  name 'MicroK8s'
  homepage 'https://microk8s.io/'

  binary 'microk8s'
end

