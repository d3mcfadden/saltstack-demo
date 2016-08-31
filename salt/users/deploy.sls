deploy:
  user.present:
    - shell: /bin/bash
  ssh_auth.present:
    - user: deploy
    - names:
      - ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAtT4uWKlkLDk1BoaRO8AYw7muPMnHsd2AG6t5ndohVmTTA/AdKN3WLd/BjaZgaJUzlJFqkEslVS2sdrE847WJqTpQ001KlvfNBNk0TU52yK5OIioXx+gNlZIlrZVo1Bxq6KR2WOp59vS09DvU3DcSo5aHZgwiX8sttpQUi+T04WodwLxKflcoKemHuhz+KovvguNhFiF66l/PcWbULCTLUA8rjJDTW9tEoCPgeAPQvvAWIFeeEHLvmn1VwwQEjtX98XA+jrMEMiIeNeUc+au3f5PrOrlH+hTueZoEvZp2FojjX92wwgz28dqCXbt4vw3aK28tlUYfS8OIOr3GPwC8rw== d3mcfadden@Robert-McFaddens-MacBook-Pro.local
  group.present:
    - members:
      - deploy
