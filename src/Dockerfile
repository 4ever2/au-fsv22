ARG COQ_IMAGE=rocq/rocq-prover:9.0.0-ocaml-4.14.2-flambda
FROM ${COQ_IMAGE}

ARG OPAM_PACKAGES="rocq-equations.1.3.1+9.0 coq-quickchick.2.1.1"

# Install opam packages
RUN opam install -y -j ${NJOBS} ${OPAM_PACKAGES} && \
    opam clean -y -a -c -s --logs && \
    eval $(opam env)
