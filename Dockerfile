FROM plus3it/tardigrade-ci:0.29.0

WORKDIR /ci-harness
ENTRYPOINT ["make"]

