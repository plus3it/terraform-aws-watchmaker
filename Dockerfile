FROM plus3it/tardigrade-ci:0.25.0

WORKDIR /ci-harness
ENTRYPOINT ["make"]

