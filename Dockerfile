FROM debian:stretch

COPY checksum /
ENV URL http://downloadirpf.receita.fazenda.gov.br/irpf/2018/irpf/arquivos/IRPF2018-1.4.zip
RUN apt-get update && apt-get install -y wget coreutils default-jre unzip xauth ttf-dejavu
RUN wget $URL && sha256sum -c checksum && unzip IRPF2018-1.4.zip
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
