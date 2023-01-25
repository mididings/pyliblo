# -*- coding: utf-8 -*-
#

# project-specific configuration
project = 'pyliblo'
copyright = '2007-2014, Dominic Sacré'
version = '0.10.0'

# general configuration
extensions = ["sphinx.ext.autodoc"]
root_doc = "index"
exclude_patterns = ["build"]
templates_path = ["templates"]
add_module_names = False

# html configuration
html_theme = 'nasophon'
html_theme_path = ["theme"]
html_copy_source = False

# extension configuration - autodoc
autodoc_member_order = "bysource"
autodoc_default_options = {
    "members": True,
    "undoc-members": True,
}
