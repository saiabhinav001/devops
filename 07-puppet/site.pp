class install_git {
  package { 'git':
    ensure   => installed,
    provider => chocolatey,
  }
}

include install_git
