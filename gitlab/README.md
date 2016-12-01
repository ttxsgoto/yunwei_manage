#### GitLab搭建说明：
---
#####1.github地址：
https://github.com/sameersbn/docker-gitlab

#####2.版本说明：
```
gitlab:8.13.3
postgresql:9.5-3
```
#####3.下载yml文件
```
wget https://raw.githubusercontent.com/sameersbn/docker-gitlab/master/docker-compose.yml
```
#####4.pull镜像
```
docker pull sameersbn/redis:latest
docker pull sameersbn/postgresql:9.5-3
docker pull sameersbn/gitlab:8.13.3
```
#####5.启动gitlab
```
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose    
chmod +x /usr/local/bin/docker-compose
docker-compose -version
docker-compose up -d	#备注：在存放docker－compose.yml的相同同级目录执行
```
#####6.其他说明：
- 相关配置选项具体见docker-compose.yml文件
- 需修改容器存放的数据目录
- 对外开放的端口
- 支持https
- 使用nginx代理到后端

