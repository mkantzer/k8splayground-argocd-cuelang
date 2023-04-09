FROM quay.io/cybozu/ubuntu:22.04 AS ubuntu

ARG CUE_VERSION=0.4.3

WORKDIR /work
RUN curl -sSL -o cue.tar.gz https://github.com/cue-lang/cue/releases/download/v${CUE_VERSION}/cue_v${CUE_VERSION}_linux_amd64.tar.gz \
    && tar xvzf cue.tar.gz \
    && rm -f cue.tar.gz

FROM quay.io/argoproj/argocd:v2.6.7

COPY --from=ubuntu /work/cue /usr/local/bin/cue