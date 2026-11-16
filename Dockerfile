FROM plus3it/tardigrade-ci:0.33.2

WORKDIR /ci-harness
ENTRYPOINT ["make"]

