FROM plus3it/tardigrade-ci:0.24.15

WORKDIR /ci-harness
ENTRYPOINT ["make"]

