FROM coqorg/coq:8.15.2-ocaml-4.14.0-flambda

# build dependencies
RUN ["/bin/bash", "--login", "-c", "set -x \
  && opam update -y -u \
  && opam install -y -v -j ${NJOBS} coq-quickchick.1.6.1 coq-equations.1.3+8.15 \
  && opam clean -a -c -s --logs"]
