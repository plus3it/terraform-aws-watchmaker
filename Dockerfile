FROM plus3it/tardigrade-ci:0.28.1

WORKDIR /ci-harness
ENTRYPOINT ["make"]

