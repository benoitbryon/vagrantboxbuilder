"""vagrantboxbuilder automates the creation of Vagrant base boxes."""
import pkg_resources


distribution = pkg_resources.get_distribution(__package__)

#: Module version, as defined in PEP-0396.
__version__ = distribution.version
