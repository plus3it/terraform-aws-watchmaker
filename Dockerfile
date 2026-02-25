FROM plus3it/tardigrade-ci:0.28.7

WORKDIR /ci-harness
ENTRYPOINT ["make"]

