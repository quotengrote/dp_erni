# Proxy für apt
vi  /etc/apt/apt.conf
Acquire::http::proxy "http://11.8.108.254:8080/";
Acquire::https::proxy "http://11.8.108.254:8080/";
