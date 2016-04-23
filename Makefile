include Makefile.conf

CAMLC=ocamlc
################################################################################
################################## Rules #######################################
.PHONY: all $(NAME) check_dir test run_test clean fclean re

all: $(NAME)

$(NAME): build
	ocamlc -a -o $(NAME).cma $(CMO_FILES)

build: $(CMI_FILES) $(CMO_FILES)

##### Rules for compilation
$(CMO_DIRECTORY)/%.cmo: $(ML_DIRECTORY)/%.ml
	$(CAMLC) -c -o $@ -I $(MLI_DIRECTORY) -I $(CMI_DIRECTORY) -I $(CMO_DIRECTORY) $<
$(CMI_DIRECTORY)/%.cmi: $(MLI_DIRECTORY)/%.mli
	$(CAMLC) -c -o $@ -I $(MLI_DIRECTORY) -I $(CMI_DIRECTORY) -I $(CMO_DIRECTORY) $<

test: build $(TEST_FILES)

run_test: fclean $(TEST_NATIVE)

$(TEST_DIRECTORY)/%_test.ml: $(ML_DIRECTORY)/%.ml
	qtest -o $@ extract $<

$(TEST_BUILD_DIRECTORY)/%.native: $(TEST_DIRECTORY)/%.ml
	@ocamlbuild -cflags -warn-error,+26 -use-ocamlfind -package oUnit -package qcheck $@
	@./$(shell basename $@)

##### Rules for clean
clean:
	$(RM) $(CMO_FILES) $(CMI_FILES)

clean_test:
	$(RM) $(TEST_FILES) $(TEST_NATIVE)
	$(RM) qtest.targets.log
	ocamlbuild -clean

fclean: clean_test clean
	$(RM) $(NAME).cma

re: fclean all
################################################################################
