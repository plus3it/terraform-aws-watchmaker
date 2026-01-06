FROM plus3it/tardigrade-ci:0.28.6

WORKDIR /ci-harness
ENTRYPOINT ["make"]

