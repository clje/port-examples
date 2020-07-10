# erlang-port-examples

*A Clojerl/OTP application for running Port examples in various languages*

**WIP**: Once the release support is tuned in Clojerl (or its rebar3
plugins/templates) the Go and Common Lisp servers will be added.

## About

This project is a [Clojerl](https://github.com/clojerl/clojerl) conversion of
the Erlang project
[erlsci/port-examples](https://github.com/erlsci/port-examples) which
demonstrates communicating with applications written in other languages
via the
[Erlang ports](https://erlang.org/doc/reference_manual/ports.html) mechanism

## Dependencies & Setup

This application assumes that the following are on your system:

* `git`
* GNU `make`
* `rlwrap`
* A modern install of Erlang (v20+)
* [rebar3](https://www.rebar3.org/) (Erlang build tool)
* Golang
* SBCL (Steel Bank Common Lisp)
* Quicklisp (CL deps manager)

This project's `rebar.config.script` will sett the required Go environment
variables, but you will need to link the Common Lisp examples to your local
Quicklisp directory (see below for details).

## Build & Run

```shell
$ make
```

This will clone the Go and Common Lisp repos that are used in the examples.
Now you need to tell Quicklisp about the cloned Common Lisp libs:

```shell
$ cd apps/ports/priv/cl-port-examples/
$ ln -s `pwd` ~/quicklisp/local-projects/
$ cd -
```

Now the app is ready to run:

```shell
$ make run
```

See the running port `gen_server`s:

```clj
(ports.app:children)
```
```clj
#erl(#erl[lisp_echo_server <0.258.0> worker #erl(lisp_echo_server)]
     #erl[go_echo_server <0.257.0> worker #erl(go_echo_server)])
```

## Echo Examples

```clj
(ports.go/send(#erl[:command :echo]))
```
```clj
#erl[:result "echo"]
```

```clj
(ports.lisp/send(#erl[:command :echo]))
```
```clj
#erl[:result "echo"]
```

There is also a simple echo `gen_server` that doesn't use ports, but this is
mostly here for sanity-checking and troubleshooting:

```clj
(ports.echo/echo "hey, it's a thing")
```
```
"hey, it's a thing"
```
