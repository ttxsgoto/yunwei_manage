### Harbor搭建和使用说明
---
#### 一.搭建说明
1. 版本说明
```
registry:2.5.0
```

2. docker镜像地址
```
docker pull vmware/harbor-db
docker pull vmware/harbor-jobservice
docker pull vmware/harbor-log
docker pull vmware/harbor-ui
docker pull nginx:1.11.5
docker pull library/registry:2.5.0
```

4. github地址
```
https://github.com/vmware/harbor
```

5. 运行
```
docker-compose up -d
```


#### 二.使用说明
1.访问对应的地址，输入用户名密码，登录成功，可进行相关操作

2.Ubuntu系统使用说明如下：

**（1）修改docker配置**

    需要修改docker的配置文件/etc/default/docker，添加下面的内容

    DOCKER_OPTS="--insecure-registry x.x.x.x"

    然后在重启docker 服务service docker restart

**（2）登录docker仓库**

	docker login x.x.x.x     ＃回车后输入用户名密码，登录成功后可使用

**（3）拉取／上传镜像**

    拉取：docker pull   x.x.x.x/public/ubuntu:14.04

    上传：docker push x.x.x.x/public/ubuntu:14.04
