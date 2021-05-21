##### proxy systemweit setzen(außer apt)
`nano /etc/environment`

##### Inhalt
```
http_proxy="http://11.8.108.254:8080/"
https_proxy="http://11.8.108.254:8080/"
no_proxy="localhost,127.0.0.1,11.10.31.*, *.ausbildung.md"
```
##### Neustart
`init 6`


##### Proxy mit export für aktuelle sitzung setzen
> export HTTP_PROXY=http_proxy="http://11.8.108.254:8080"
> export HTTPS_PROXY=https_proxy="http://11.8.108.254:8080"
