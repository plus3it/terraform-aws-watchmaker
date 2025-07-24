FROM plus3it/tardigrade-ci:0.27.1

WORKDIR /ci-harness
ENTRYPOINT ["make"]

