MAKE = make


OCAMLFIND = ocamlfind
OCAML = ocamlc

LIB = ./lib
BIN = ./bin

account.cma:
	${OCAMLFIND} ${OCAML} -package "netclient" -a account.ml -o ${LIB}/account.cma
login: account.cma
	${OCAMLFIND} ${OCAML} -linkpkg -package "netclient" -package "ssl" -package "equeue-ssl" ${LIB}/account.cma ./Tests/login.ml -o ${BIN}/login

all:
	${MAKE} login
