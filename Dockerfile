FROM plus3it/tardigrade-ci:0.24.14

WORKDIR /ci-harness
ENTRYPOINT ["make"]

