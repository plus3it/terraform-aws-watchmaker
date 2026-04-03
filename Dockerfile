FROM plus3it/tardigrade-ci:0.29.2

WORKDIR /ci-harness
ENTRYPOINT ["make"]

