# -*- coding: utf-8 -*-
import os
import sys
import sphinx_bootstrap_theme

ROOT = os.path.abspath(os.path.dirname(__file__))
sys.path.append(ROOT)

# -- General configuration ------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'fortran_domain',
    'htmlhidden'
]

# The suffix of source filenames.
source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'Fortran interface to chemfiles'
copyright = u'2015-2017, Guillaume Fraux — BSD licence'


def version():
    with open(os.path.join(ROOT, "..", "chemfiles", "VERSION")) as f:
        full_version = f.read().split('-')
    release = full_version[0]
    version = '.'.join(release.split('.')[0:2])
    if len(full_version) > 1:
        # Developement release
        release += "-dev"
        version += "-dev"
    return (version, release)


version, release = version()

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
exclude_patterns = []

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
html_theme = 'bootstrap'
html_theme_path = sphinx_bootstrap_theme.get_html_theme_path()

# Output file base name for HTML help builder.
htmlhelp_basename = 'chemfiles'
