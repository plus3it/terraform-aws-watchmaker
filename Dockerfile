FROM plus3it/tardigrade-ci:0.25.2

WORKDIR /ci-harness
ENTRYPOINT ["make"]

