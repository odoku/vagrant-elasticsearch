# Elasticsearchのテスト環境


## 起動

```
vagrant up
```

`Elasticsearch`は自動起動しないので、VM再起動したら中に入って起動して下さい。

```
vagrant ssh
sudo /etc/init.d/elasticsearch start
```


## アクセス

http://localhost:9200


## プラグイン一覧

### 一覧表示

http://localhost:9200/_nodes/_all?plugin=true&pretty

### ショートカット

*   http://localhost:9200/_plugin/inquisitor
*   http://localhost:9200/_plugin/HQ
*   http://localhost:9200/_plugin/head
*   http://localhost:9200/_plugin/marvel
