FROM plus3it/tardigrade-ci:0.29.6

WORKDIR /ci-harness
ENTRYPOINT ["make"]

