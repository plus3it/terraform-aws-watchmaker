FROM plus3it/tardigrade-ci:0.27.0

WORKDIR /ci-harness
ENTRYPOINT ["make"]

