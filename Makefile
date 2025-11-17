.PHONY: init
init:
	cmake -S . -G "Ninja" -B cmake && ln -s cmake/compile_commands.json .

.PHONY: build
build:
	cmake -S . -G "Ninja" -B cmake

.PHONY: rebuild
rebuild:
	cmake --build ./cmake --target rebuild_cache

.PHONY: clean
clean:
	cmake --build ./cmake --target clean

.PHONY: compile_all
compile_all:
	cmake --build ./cmake --target all

# If the first argument is good pass the rest of the line to the target
ifeq (compile,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "good"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: compile
compile:
	cmake --build ./cmake --target $(RUN_ARGS)

