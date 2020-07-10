repl:
	@rlwrap rebar3 clojerl repl

clean:
	@rebar clean

clean-all: clean
	@rm -rf ./_build
