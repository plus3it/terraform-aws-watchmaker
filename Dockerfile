FROM plus3it/tardigrade-ci:0.28.5

WORKDIR /ci-harness
ENTRYPOINT ["make"]

