FROM frolvlad/alpine-glibc:alpine-3.18

RUN apk add --no-cache ca-certificates wget tar && \
    update-ca-certificates

WORKDIR /app

RUN wget https://github.com/kaz/pprotein/releases/download/v1.2.4/pprotein_1.2.4_linux_amd64.tar.gz && \
    tar -xvf pprotein_1.2.4_linux_amd64.tar.gz && \
    mv pprotein /usr/local/bin/

RUN wget https://github.com/tkuchiki/slp/releases/download/v0.2.1/slp_linux_amd64.tar.gz && \
    tar -xvf slp_linux_amd64.tar.gz && \
    mv slp /usr/local/bin/

RUN wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.tar.gz && \
    tar -xvf alp_linux_amd64.tar.gz && \
    mv alp /usr/local/bin/

EXPOSE 9000

CMD ["/usr/local/bin/pprotein"]
