"""Various utilities."""
from contextlib import contextmanager
import shutil
import subprocess
import tempfile


@contextmanager
def use_temp_dir():
    """Create temporary directory, return it's name, delete it at the
    end of the context execution, even if an exception is raised.

    >>> import os
    >>> try:
    ...     with use_temp_dir() as directory:
    ...         os.path.exists(directory)
    ...         os.path.isdir(directory)
    ...         raise Exception('Dummy Exception')
    ... except:
    ...     pass
    True
    True
    >>> os.path.exists(directory)
    False

    """
    directory = tempfile.mkdtemp()
    try:
        yield directory
    finally:
        shutil.rmtree(directory)


def execute_command(command, data={}):
    """Execute a shell command.

    Command is a string ; data a dictionnary where values are supposed to be
    strings or integers and not variables or commands.

    Command and data are combined with string format operator.

    Return command's exit code.

    >>> execute_command('echo "%(msg)s"', {'msg': 'Hello world!'})
    Executing echo "Hello world!"
    0
    """
    if data:
        command = command % data
    print "Executing %s" % command
    return subprocess.call(command, shell=True)
