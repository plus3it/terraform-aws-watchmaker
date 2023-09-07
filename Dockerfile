FROM plus3it/tardigrade-ci:0.24.12

WORKDIR /ci-harness
ENTRYPOINT ["make"]

