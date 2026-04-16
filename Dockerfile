FROM plus3it/tardigrade-ci:0.29.4

WORKDIR /ci-harness
ENTRYPOINT ["make"]

