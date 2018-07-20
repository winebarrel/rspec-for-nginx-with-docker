RSpec for Nginx with Docker
---------------------------

## Installation

```sh
bundle install
```

## Run tests

```sh
bundle install
bundle exec rake spec:build
bundle exec rake spec:configtest
bundle exec rake spec:test
bundle exec rake spec:clean
```

## Make a cert

```sh
bundle exec rake spec:make-cert[hello.example.com]
```
