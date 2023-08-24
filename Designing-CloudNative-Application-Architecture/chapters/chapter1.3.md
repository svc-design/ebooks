
CDN，即内容分发网络（Content Delivery Network）是一种边缘网络，其目的是通过在各地布置节点服务器，使用户可以就近获取所需内容，解决互联网瓶颈问题，提高用户访问响应速度和命中率。

CDN 分类：

静态CDN：主要用于分发不经常变动的内容，比如图片、CSS、JavaScript 文件等。这些内容被缓存在 CDN 的边缘节点上，用户请求时直接从最近的节点获取，减少了原始服务器的负载和网络延迟。

动态CDN：针对动态内容进行优化，如 PHP、Python、Node.js、Java、Go、Rust、C/C++、Ruby 等语言生成的动态页面。动态 CDN 通常使用路由优化和 TCP 连接优化等技术，使动态内容能够更快地从原始服务器传输到用户。

流媒体CDN：专门用于传输音频和视频流。流媒体 CDN 可以对流进行处理，例如分割成多个段，以适应不同的网络条件和设备。常见的流媒体格式有 HLS、DASH 等。

不同云服务提供商的 CDN 服务：

AWS：提供名为 CloudFront 的 CDN 服务。CloudFront 支持静态、动态和流媒体内容的分发，并且与 AWS 的其他服务（如 S3、EC2）紧密集成。

GCP：Google Cloud CDN 利用 Google 的全球网络和边缘点来提供 CDN 服务。它支持 HTTP/2 和 QUIC 协议，可以提高动态内容的传输速度。

微软云：Azure CDN 提供了基于 Microsoft 的全球网络的 CDN 服务。Azure CDN 支持静态和动态内容的分发，并且与 Azure 的其他服务（如 Storage、Web Apps）紧密集成。

阿里云：阿里云 CDN 提供了基于阿里巴巴集团的全球网络的 CDN 服务。阿里云 CDN 支持静态和动态内容的分发，并且与阿里云的其他服务（如 OSS、ECS）紧密集成。

腾讯云：腾讯云 CDN 提供了基于腾讯集团的全球网络的 CDN 服务。腾讯云 CDN 支持静态和动态内容的分发，并且与腾讯云的其他服务（如 COS、CVM）紧密集成。

Cloudflare：作为一个独立的 CDN 供应商，Cloudflare 提供了全球范围内的 CDN 服务。除了基本的 CDN 功能外，Cloudflare 还提供了一系列安全性和性能优化功能。

总结表格：

云服务提供商	静态CDN	动态CDN	流媒体CDN	集成服务
AWS	是	是	是	S3, EC2
GCP	是	是	是	Google Storage, Compute Engine
微软云	是	是	是	Azure Storage, Web Apps
阿里云	是	是	是	OSS, ECS
腾讯云	是	是	是	COS, CVM
Cloudflare	是	是	是	无（独立CDN供应商）
注意：以上信息可能因各云服务提供商的产品更新而变动，请以各官方网站公布的信息为准。
