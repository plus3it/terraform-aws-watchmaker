FROM plus3it/tardigrade-ci:0.26.2

WORKDIR /ci-harness
ENTRYPOINT ["make"]

