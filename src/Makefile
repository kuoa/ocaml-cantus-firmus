LIBS = str
PROGRAM = main.native

all:
	ocamlbuild -libs $(LIBS) $(PROGRAM);
	@mv main.native cantus_firmus

clean:
	ocamlbuild -clean

.PHONY: all clean
