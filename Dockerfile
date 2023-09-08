FROM plus3it/tardigrade-ci:0.24.13

WORKDIR /ci-harness
ENTRYPOINT ["make"]

