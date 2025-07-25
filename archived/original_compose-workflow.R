name: Publish to npm

on:
  schedule:
  - cron: '45 13 * * *'

#workflow_dispatch:

jobs:
  build-and-publish:
  runs-on: ubuntu-latest

steps:
  - name: Checkout repository
uses: actions/checkout@v2
continue-on-error: false

- name: Install Docker using Docker's official script
        run: |
          curl -fsSL https://get.docker.com -o get-docker.sh
          sudo sh get-docker.sh
        continue-on-error: false

      - name: Install Docker Compose
        run: |
          sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
          sudo chmod +x /usr/local/bin/docker-compose
          docker-compose --version
        continue-on-error: false

      - name: Start application-specific services using Docker Compose
        run: docker-compose up -d
        continue-on-error: false

