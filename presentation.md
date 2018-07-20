# Nginxのテストを
# RSpec+Dockerでする話

---
# hello.example.com

![inline](https://cdn.pbrd.co/images/Hvj5KqH.jpg)

---
# hello.example.com

```nginx
server {
  listen 80;
  server_name hello.example.com;

  location / {
    proxy_pass http://backend;
  }
}
```

---
# tools

* Docker(+docker-compose)
* Infrataster
  * RSpecでhttpdの振る舞いをテストできる

---
# テスト構成

![inline](https://cdn.pbrd.co/images/Hvj8Zvd.jpg)

---
# テスト構成

* Tasterコンテナ
  * infratasterを載せたコンテナ
* ELBコンテナ
  * SSLターミネーションを行うコンテナ

---
# テスト構成

* Nginxコンテナ
  * テスト対象
* Backendコンテナ
  * バンックエンドアプリのダミー

---
# ファイル構成

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── itamae/
│   ├── files/
│   │   └── etc/
│   │       └── nginx/
│   │           └── conf.d/
│   │               └── hello.conf
│   └── reverse-proxy.rb
├── presentation.md
```

---
# ファイル構成
```
└── spec/
    ├── backend/
    │   ├── Dockerfile
    │   └── files/
    │       └── backend.rb*
    ├── elb/
    │   ├── Dockerfile
    │   └── files/
    │       └── etc/
    │           └── nginx/
    │               └── conf.d/
    │                   └── default.conf.tmpl
```

---
# ファイル構成
```
    ├── reverse-proxy/
    │   ├── Dockerfile
    │   ├── docker-compose.yml
    │   └── spec/
    │       ├── hello.example.com_spec.rb
    │       └── spec_helper.rb
    ├── rproxy-pantry/
    │   └── spec/
    ├── ssl/
    │   ├── Dockerfile
    │   ├── docker-compose.yml
    │   ├── hello.example.com.crt
    │   ├── hello.example.com.key
    │   ├── make-crt.sh*
    │   ├── root.crt
    │   └── root.key
    └── taster/
        └── Dockerfile
```

---
# ファイル構成

## https://github.com/winebarrel/rspec-for-nginx-with-docker/

---
# Demo
