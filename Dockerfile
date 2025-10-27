FROM plus3it/tardigrade-ci:0.28.3

WORKDIR /ci-harness
ENTRYPOINT ["make"]

