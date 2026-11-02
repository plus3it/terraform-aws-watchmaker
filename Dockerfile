FROM plus3it/tardigrade-ci:0.32.0

WORKDIR /ci-harness
ENTRYPOINT ["make"]

