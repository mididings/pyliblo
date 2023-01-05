#!/usr/bin/env python
# -*- coding: utf-8 -*-

from Cython.Build import cythonize
from setuptools import setup, Extension

setup(
    scripts=[
        "scripts/send_osc",
        "scripts/dump_osc",
    ],
    data_files=[
        (
            "share/man/man1",
            [
                "scripts/send_osc.1",
                "scripts/dump_osc.1",
            ],
        ),
    ],
    ext_modules=cythonize(
        [
            Extension(
                "liblo",
                [
                    "src/liblo.pyx",
                ],
                extra_compile_args=[
                    "-fno-strict-aliasing",
                    "-Werror-implicit-function-declaration",
                    "-Wfatal-errors",
                ],
                libraries=[
                    "lo",
                ],
            ),
        ],
        language_level=3,
    ),
    zip_safe=False,
)
