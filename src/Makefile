LIBS = str
PROGRAM = main.native

all:
	ocamlbuild -libs $(LIBS) $(PROGRAM);
	@mv main.native main

clean:
	ocamlbuild -clean

.PHONY: all clean
