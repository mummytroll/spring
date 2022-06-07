FROM centos:7
COPY ./entrypoint.sh /usr/bin/entrypoint.sh
COPY ./dash.json /dash.json
RUN yum -y install curl
ENTRYPOINT [ "entrypoint.sh" ]
CMD ["echo", "--- GRAFANA IS UPDATED ---"]

