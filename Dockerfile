FROM plus3it/tardigrade-ci:0.29.5

WORKDIR /ci-harness
ENTRYPOINT ["make"]

