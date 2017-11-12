# Parcial 1 - Daniel Gutierrez A00320176

El siguiente repositorio es creado para dar respuesta a:

*`
Deberá	realizar	el	aprovisionamiento	de	un	ambiente	compuesto	por	los	siguientes	elementos: Un servidor encargado de almacenar logs por medio de la aplicación Elasticsearch, un servidor encargado de hacer la conversión de logs por medio de la aplicación Logstash, un servidor con la herramienta encargada de visualizar la información de los logs por medio de la aplicación Kibana, por último uno o varios servidores web ejecutando la aplicación filebeat para el envío de los logs al servidor con Logstash*
`*


## Comandos de Linux necesarios para el aprovisionamiento de los servicios solicitados.

### Filebeat

Comando | Descripción
------------ | -------------
`sudo yum -y install filebeat` | Despues de que Chef copie el archivo `filebeat.repo` al directorio de los repositorios de `yum` se podra realizar la instalacion
`systemctl daemon-reload``systemctl enable filebeat``systemctl start filebeat``systemctl restart network` | Despues de pasar el archivo de configuracion `filebeat.yml`, se encargan de configurar e iniciar el servicio 


### Logstash

Comando | Descripción
------------ | -------------
`sudo yum install -y java-1.8.0-openjdk` `sudo yum -y install logstash` | Despues de que Chef copie el archivo `logstash.repo` al directorio de los repositorios de `yum` se podra realizar la instalacion
`systemctl start firewalld` `firewall-cmd --add-port=5044/tcp`` firewall-cmd --add-port=5044/tcp --permanent``systemctl restart network` `sudo service logstash start`| Despues de pasar el archivo de configuracion `logstash.yml`, se encargan de configurar e iniciar el servicio 


### Elasticsearch

Comando | Descripción
------------ | -------------
`sudo yum install -y java-1.8.0-openjdk` `    yum -y install elasticsearch` | Despues de que Chef copie el archivo `elasticsearch.repo` al directorio de los repositorios de `yum` se podra realizar la instalacion
`systemctl start firewalld` `firewall-cmd --add-port=9200/tcp`` firewall-cmd --add-port=9200/tcp --permanent``systemctl restart network`| Despues de pasar el archivo de configuracion `elasticsearch.yml`, se encargan de configurar el servicio
`curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json && curl -XPUT 'http://192.168.56.104:9200/_template/filebeat?pretty' -d@filebeat-index-template.json`` sudo service elasticsearch start`| Se encargan de pasar el template del index de filebeat a elasticsearch e iniciar el servicio


### Kibana

Comando | Descripción
------------ | -------------
`sudo yum install -y java-1.8.0-openjdk` `sudo yum -y install kibana` | Despues de que Chef copie el archivo `kibana.repo` al directorio de los repositorios de `yum` se podra realizar la instalacion
`systemctl start firewalld` `firewall-cmd --add-port=5601/tcp`` firewall-cmd --add-port=5601/tcp --permanent``systemctl restart network` `sudo systemctl enable kibana``sudo systemctl start kibana`| Despues de pasar el archivo de configuracion `kibana.yml`, se encargan de configurar e iniciar el servicio 
