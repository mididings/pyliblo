import os
import re

def open_and_extract(filepath, regex, line_match):
    with open(filepath) as input_file:
        lines = input_file.readlines()

        for line in lines:
            if line.startswith(line_match):
                match = regex.match(line)

                if match:
                    return match.group(1)

class TestVersion:
    def test_versions_match(self):
        version = None
        liblo_version = None

        pyproject_ver = re.compile(r"version = \"(.*)\"")
        liblo_pyx_ver = re.compile(r"__version__ = \"(.*)\"")

        version = open_and_extract("pyproject.toml", pyproject_ver, "version")
        liblo_version = open_and_extract("src/liblo.pyx", liblo_pyx_ver, "__version__")

        assert version is not None
        assert liblo_version is not None
        assert version == liblo_version
