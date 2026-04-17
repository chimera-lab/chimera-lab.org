# :building_construction: Template Hierarchy Validation

## :book: Table of Contents

- [:building_construction: Template Hierarchy Validation](./#building_construction-template-hierarchy-validation)
  - [:telescope: Overview](./#telescope-overview)
  - [:building_construction: Structure](./#building_construction-structure)

## :telescope: Overview

Audit executed with SSH socket auth at /tmp/ssh-chimera.sock and CMR command `cmr repo template validate` (note: --summary flag is planned for future release).

## :building_construction: Structure

| Repository Path | Template Detection | Template Diff Summary |
|---|---|---|
| ./projects.topic/chimera-lab-cli.project | project.template | no-template-detected |
| ./projects.topic/chimera-lab-website.project/chimera-lab-website.laravel_docker_scaffold/docker/composer_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-website.project/chimera-lab-website.laravel_docker_scaffold/docker/node_docker.scaffold | scaffold.template | no-template-detected |
| ./template.topic/docker_scaffold.template/docker/wordpress_docker.scaffold/config/dev/plugins/wordpress-plugin-abstraction.app | not-detected | invalid-repo-context |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/laravel-workspace_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/phpmyadmin_docker.scaffold/docker/mysql_docker.scaffold | not-detected | invalid-repo-context |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/laravel-php-fpm_docker.scaffold | scaffold.template | no-template-detected |
| ./template.topic/docker_scaffold.template/docker/apache-httpd_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/nginx_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/laravel-php-worker_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-cli-website.project/chimera-lab-cli-website.laravel_docker_scaffold/docker/phpmyadmin_docker.scaffold | scaffold.template | no-template-detected |
| ./template.topic/docker_scaffold.template/docker/prusaslicer_docker.scaffold | scaffold.template | no-template-detected |
| ./template.topic/docker_scaffold.template/docker/wordpress_docker.scaffold | scaffold.template | no-template-detected |
| ./template.topic/docker_scaffold.template/docker/registry_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-chat.project/chimera-lab-chat.docker_scaffold/docker/postgres_docker.scaffold | scaffold.template | no-template-detected |
| ./projects.topic/chimera-lab-infra.project/chimera-lab-traefik.docker_scaffold/docker/traefik_docker.scaffold | not-detected | invalid-repo-context |
| ./template.topic | topic.template | diverged |
| ./social-sciences.topic/legal.topic | topic.template | no-template-detected |
| ./social-sciences.topic/finance.topic | topic.template | no-template-detected |
| ./template.topic/scaffold.template | repository.template | diverged |
| ./formal-sciences.topic/computer-science.topic | topic.template | no-template-detected |
| ./template.topic/repository.template | repository.template | synchronized |
| ./arts.topic/art.topic | not-detected | invalid-repo-context |
| ./arts.topic | topic.template | diverged |
| ./humanities.topic | topic.template | diverged |
| ./social-sciences.topic | topic.template | no-template-detected |
| ./formal-sciences.topic | topic.template | diverged |
| ./natural-sciences.topic | topic.template | diverged |
| ./template.topic/topic.template | repository.template | diverged |
