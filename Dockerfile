##FROM caapim/gateway:latest
FROM docker.stable1.apimgcp.com/repository/docker-hosted/gateway:wlui-test
USER root
COPY consul-template/consul-template /opt/consul-template/
COPY consul-template/config.hcl /opt/consul-template/config.hcl
RUN chmod +x /opt/consul-template/consul-template

## Copying the deployment package
COPY deployment/build/gateway/deployment-0.6.0.gw7 /opt/docker/rc.d/deployment.gw7
## Make restman available
RUN touch /opt/SecureSpan/Gateway/node/default/etc/bootstrap/services/restman
## Copy aar file
COPY docker/*.aar /opt/SecureSpan/Gateway/runtime/modules/assertions/
