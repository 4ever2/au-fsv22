ARG COQ_IMAGE=coqorg/coq:8.15.2-ocaml-4.14.0-flambda
FROM ${COQ_IMAGE}

ARG OPAM_PACKAGES=coq-equations.1.3+8.15

# Install opam packages
# QuickChick is pinned manually to a specific commit since 2.0 beta release is not on opam
RUN opam install -y -j ${NJOBS} ${OPAM_PACKAGES} && \
    opam pin -y -j ${NJOBS} add https://github.com/QuickChick/QuickChick.git#a1522e07b01fcd948407a06726e495debb99ae8f && \
    opam clean -y -a -c -s --logs && \
    eval $(opam env)
