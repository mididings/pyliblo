#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

build-dir := `python3 dev/get-buildpath.py`

_default:
  just --list

# clean everything
clean: clean-pycache clean-build clean-manpages clean-documentation

# delete python cache artifacts
clean-pycache:
	find . -name '*.pyc' -delete
	find . -name '*.pyo' -delete
	find . -name __pycache__ -delete

# delete distribution artifacts
clean-build:
  rm --force --recursive build dist *.egg-info

# delete generated man pages
clean-manpages:
  rm -rf doc/man/*.1

# delete generated documentation
clean-documentation:
  rm -rf doc/build

# build sdist & wheel
build: build-wheel build-sdist

# build wheel artifact with python -m build
build-wheel: build-manpages
  python3 -m build --no-isolation --wheel

# build sdist artifact with python -m build
build-sdist: build-manpages
  python3 -m build --no-isolation --sdist

# generate documentation with sphinx
build-documentation: build-wheel
  PYTHONPATH={{build-dir}} sphinx-build -b html -d doc/build/doctrees doc doc/build/html

# generate reproducible man pages with scdoc
build-manpages:
  #!/usr/bin/env bash
  pushd doc/man > /dev/null
    for script in send_osc dump_osc; do
      scdoc < "${script}.scd" > "${script}.1"
    done
    bash reproducible-man.sh
  popd > /dev/null

# run test suite with pytest
test: build-wheel
  PYTHONPATH={{build-dir}} pytest -v 
