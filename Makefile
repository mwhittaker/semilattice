all: check.byte

check.byte: check.ml
	ocamlbuild -use-ocamlfind -pkg qcheck check.byte --

clean:
	rm -rf _build
	rm -f  *.byte
