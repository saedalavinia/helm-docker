FROM alpine
ENV helm_version=v2.12.1

RUN apk -v --update --no-cache add \ 
        curl  \
        python3 \
        && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip install awscli --upgrade && rm get-pip.py
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \ 
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl
RUN curl -o "helm.tar.gz" -L "https://storage.googleapis.com/kubernetes-helm/helm-${helm_version}-linux-amd64.tar.gz" && \
    tar -zxvf "helm.tar.gz" && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \ 
	  rm -rf "helm.tar.gz"      

