FROM plus3it/tardigrade-ci:0.29.3

WORKDIR /ci-harness
ENTRYPOINT ["make"]

