ARG COQ_IMAGE=coqorg/coq:8.17.1-ocaml-4.14.1-flambda
FROM ${COQ_IMAGE}

ARG OPAM_PACKAGES="coq-equations.1.3+8.17 coq-quickchick.2.0.0"

# Install opam packages
RUN opam install -y -j ${NJOBS} ${OPAM_PACKAGES} && \
    opam clean -y -a -c -s --logs && \
    eval $(opam env)
