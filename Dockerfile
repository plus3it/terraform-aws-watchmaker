FROM plus3it/tardigrade-ci:0.28.4

WORKDIR /ci-harness
ENTRYPOINT ["make"]

