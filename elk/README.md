###ELK搭建说明
---

1.版本说明
```
elasticsearch-5.0.1
logstash-5.0.1
kibana-5.0.1
```

2.部署说明

- JDK安装目录
```
tar -zxvf jdk1.8.0_91.tar.gz -C /opt/
```
- elk安装
	**elasticsearch-5.0.1安装**
    ``` 
    cd elk/elasticsearch-5.0.1/
    echo """
    network.host: 127.0.0.1
    http.port: 9200
    transport.tcp.port: 9300
    """>>config/elasticsearch.yml
    
    ```
    **kibana-5.0.1安装**
    ```
    cd elk/kibana-5.0.1
    echo """
    server.host: "127.0.0.1"
    elasticsearch.url: "http://127.0.0.1:9200"
    """>>config/kibana.yml

    ```
    **启动**
    ```
    echo """
    export JAVA_HOME=/opt/jdk1.8.0_91
	export PATH=$JAVA_HOME/bin:$PATH
	export JRE_HOME=${JAVA_HOME}/jre
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
	nohup /data/elk/elasticsearch-5.0.1/bin/elasticsearch -d
    """ >start.sh
    chmod +x start.sh
    ES启动：
    cd elk/elasticsearch-5.0.1/ && ./start.sh
    Kibana启动：
    cd elk/kibana-5.0.1/bin/ && nohup ./kibana &
    ```
	**logstash-5.0.1安装**
    ```
    cd elk/logstash-5.0.1
	echo """
    export JAVA_HOME=/opt/jdk1.8.0_91
	export PATH=$JAVA_HOME/bin:$PATH
	export JRE_HOME=${JAVA_HOME}/jre
	export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
	nohup /data/elk/logstash-5.0.1/bin/logstash -f /data/elk/logstash-5.0.1/conf.d/all.conf &
    """ >start.sh
    chmod +x start.sh
    ```
	**启动logstash**
    ```
     cd elk/logstash-5.0.1 && ./start.sh
    ```


4.logstash配置文件见gitlab

5.nignx日志格式
```
log_format main_json '{ "timestamp": "$time_local", '
                         '"remote_addr": "$remote_addr", '
                         '"remote_user": "$remote_user", '
                         '"body_bytes_sent": "$body_bytes_sent", '
                         '"request_time": "$request_time", '
                         '"status": "$status", '
                         '"domain": "$host", '
                         '"request": "$request", '
                         '"request_method": "$request_method", '
                         '"http_referrer": "$http_referer", '
                         '"body_bytes_sent":"$body_bytes_sent", '
                         '"http_x_forwarded_for": "$http_x_forwarded_for", '
                         '"http_user_agent": "$http_user_agent" }';
```
6.其他说明
- logstash相关配置见all.conf 文件

