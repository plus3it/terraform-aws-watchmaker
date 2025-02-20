FROM plus3it/tardigrade-ci:0.26.1

WORKDIR /ci-harness
ENTRYPOINT ["make"]

