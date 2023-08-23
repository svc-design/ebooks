## 为什么需要使用缓存？

缓存是一种存储技术，它允许应用程序快速访问存储在临时存储空间中的数据。缓存的主要目的是提高数据检索性能，通过在内存中存储常用数据，减少对慢速存储（如磁盘或网络）的访问。如果没有缓存，应用程序可能需要从数据库或其他远程位置获取数据，这可能导致延迟，并增加处理时间。

## 使用缓存后带来的优缺点

### 优点：

- 提高性能：缓存可以显著提高应用程序的性能，因为它允许应用程序快速访问数据。
- 减少网络拥塞：缓存可以减少对网络资源的需求，因为数据可以从本地缓存中获取，而不是通过网络从远程服务器获取。
- 减轻数据库压力：缓存可以减轻数据库服务器的压力，因为常用的数据可以从缓存中获取，而不是频繁查询数据库。

### 缺点：

- 数据一致性：如果数据在多个地方被缓存，可能会出现数据不一致的问题。
- 管理复杂性：维护和管理缓存可能会增加系统的复杂性。
- 内存使用：缓存数据需要额外的内存空间。

## Redis与Memcached

Redis 是一个开源的使用ANSI C编写、遵守BSD协议、支持网络、可基于内存亦可持久化的日志型、Key-Value数据库，并提供多种语言的API。它通常被称为数据结构服务器，因为值（values）可以是 字符串(String), 哈希(Hash), 列表(list), 集合(sets) 和 有序集合(sorted sets)等类型。

Memcached 是一个自由开源的，高性能，分布式内存对象缓存系统。Memcached是一个简洁的key-value存储系统，用于小块数据（例如字符串、对象）的缓存。这些数据可以是数据库调用、API调用或者是页面渲染的结果。

- Redis 和 Memcached 的对比

| 特性 | Redis | Memcached |
|:----|:----|:----|
| 数据类型 | 支持多种数据类型，如字符串、列表、集合、散列、位图和HyperLogLogs | 主要支持字符串 |
| 持久性 | 支持数据持久性，可以将数据存储在磁盘上，重启后可以重新加载 | 不支持持久性 |
| 性能 | 高性能，适合处理复杂的数据类型 | 高性能，适合简单键值存储 |
| 内存管理 | 使用更复杂的内存管理，可以在内存满时根据设置的策略删除一些键 | 使用简单的内存管理，当内存满时可能会导致新的写入失败 |
| 分布式支持 | 支持分布式，可以实现主从复制和分片 | 原生不支持分布式，但可以通过客户端实现分片 |


- 云厂商提供的缓存托管服务的对比

| 云厂商 | 服务名称 | 单机 | 主从 | 集群 | 分片 | 兼容性 |
|:----|:----|:----|:----|:----|:----|:----|
| AWS | ElastiCache | 支持 | 支持 | 支持 | 支持 | 兼容 Memcached 和 Redis |
| GCP | Cloud Memorystore | 支持 | 支持 | 不支持 | 不支持 | 兼容 Redis |
| 微软 (Azure) | Azure Cache for Redis | 支持 | 支持 | 支持 (预览版) | 支持 | 兼容 Redis |
| 阿里云 | ApsaraDB for Redis | 支持 | 支持 | 支持 | 支持 | 兼容 Redis |
| 腾讯云 | 腾讯云Redis数据库 | 支持 | 支持 | 支持 | 支持 | 兼容 Redis |


- 各种语言的缓存开发SDK参考

| 语言 | Redis SDK | Memcached SDK |
|:----|:----|:----|
| Java | Jedis, Lettuce, Spring Data Redis | XMemcached |
| PHP | PhpRedis, Predis | php-memcached |
| Python | redis-py | pymemcache |
| Node.js | node-redis | memcached |
| Vue3/React (JavaScript) | 通常不直接与Redis或Memcached交互，而是通过后端API进行交互 | 通常不直接与Redis或Memcached交互，而是通过后端API进行交互 |
| Go | go-redis | memcache |
| Rust | redis-rs | rust-memcache |
| C/C++ | hiredis | libmemcached |
| Ruby | redis-rb | dalli |

## 相关文档链接

| 类型 | 语言 | Redis 文档 | Memcached 文档 |
| --- | --- | --- | --- |
| 开源社区 | Java | [Jedis](https://github.com/redis/jedis), [Lettuce](https://github.com/lettuce-io/lettuce-core), [Spring Data Redis](https://spring.io/projects/spring-data-redis) | [XMemcached](https://github.com/killme2008/xmemcached) |
| 开源社区 | PHP | [PhpRedis](https://github.com/phpredis/phpredis), [Predis](https://github.com/nrk/predis) | [php-memcached](https://pecl.php.net/package/memcached) |
| 开源社区 | Python | [redis-py](https://github.com/andymccurdy/redis-py) | [pymemcache](https://github.com/pinterest/pymemcache) |
| 开源社区 | Node.js | [node-redis](https://github.com/NodeRedis/node-redis) | [memcached](https://github.com/3rd-Eden/memcached) |
| 开源社区 | Go | [go-redis](https://github.com/go-redis/redis) | [memcache](https://github.com/bradfitz/gomemcache) |
| 开源社区 | Rust | [redis-rs](https://github.com/mitsuhiko/redis-rs) | [rust-memcache](https://github.com/jaysonsantos/rust-memcache) |
| 开源社区 | C/C++ | [hiredis](https://github.com/redis/hiredis) | [libmemcached](https://libmemcached.org/libMemcached.html) |
| 开源社区 | Ruby | [redis-rb](https://github.com/redis/redis-rb) | [dalli](https://github.com/petergoldstein/dalli) |
| 云厂商 | AWS | [Amazon ElastiCache for Redis](https://aws.amazon.com/elasticache/redis/) | [Amazon ElastiCache for Memcached](https://aws.amazon.com/elasticache/memcached/) |
| 云厂商 | GCP | [Cloud Memorystore for Redis](https://cloud.google.com/memorystore/docs/redis) | N/A |
| 云厂商 | Azure | [Azure Cache for Redis](https://azure.microsoft.com/en-us/services/cache/) | N/A |
| 云厂商 | 阿里云 | [阿里云Redis](https://help.aliyun.com/product/26385.html) | [阿里云Memcached](https://help.aliyun.com/product/26528.html) |
| 云厂商 | 腾讯云 | [腾讯云Redis](https://cloud.tencent.com/product/crs)  | [腾讯云Memcached](https://cloud.tencent.com/product/cmem) |
