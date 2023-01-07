# pyliblo

Python bindings for the liblo OSC library.

## Requirements

* [Python](https://www.python.org/) (`>=3.7`)
* [Cython](https://www.cython.org/) (`>=0.29`)
* [liblo][liblo] (`>=0.27`)

## Installation

*Note*: Ensure that `liblo` and associated development tools are present.

To build, use the `build` module or any PEP-517 compatible
backend of your choice.

Afterwards, the wheel can be installed with pip.

```sh
python -m build --wheel

pip install dist/*.whl
```

## Documentation

* [API documentation](https://mididings.github.io/pyliblo/)
* The `examples` directory contains some example code.
* [Open Sound Control](https://opensoundcontrol.stanford.edu)
* [liblo][liblo]
* [Original homepage](https://das.nasophon.de/pyliblo/)
* [Original documentation](https://dsacre.github.io/pyliblo/doc/)

## License

LGPL-2.1-or-later as per [LICENSE](LICENSE).

Copyright (C) 2007-2015  Dominic Sacré  <dominic.sacre@gmx.de>

Copyright (C) 2023 pyliblo Contributors

[liblo]: https://liblo.sourceforge.net
