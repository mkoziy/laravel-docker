### What and why?

* A custom development docker environment for Laravel projects.
* Much faster than Homestead

### Install
* docker https://docs.docker.com/get-docker/
* docker-compose https://docs.docker.com/compose/install/
* Go to your project directory and execute `git clone git@github.com:mkoziy/laravel-docker.git -b master --single-branch docker`

### Usage
* `laravel-docker/up`
* `laravel-docker/down`

#### Services and ports
* nginx - `:80`
* php - `9000`
* xdebug - `9001`
* postresql - `5432` 

### Used libraries/projects

* Inspired by https://github.com/aschmelyun/docker-compose-laravel
* Python library for cli commands https://click.palletsprojects.com/en/7.x/
