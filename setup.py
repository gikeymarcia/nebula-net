# https://realpython.com/pypi-publish-python-package/#a-small-python-package
from pathlib import Path
from setuptools import setup, find_packages

README = Path(__file__).parent / "README.md"
# TODO: read requirements.txt and feed it into install_requires


# https://setuptools.readthedocs.io/en/latest/setuptools.html#basic-use
setup(
    name="nebula-net",
    version="0.1.0",
    description="Short description of the project",
    long_description=README.read_text(),
    long_description_content_type="text/markdown",
    url="https://github.com/gikeymarcia/",
    author="Mikey Garcia",
    author_email="username@server.org",
    license="GPL-3.0",
    packages=find_packages(exclude="test"),
    install_requires=[],
)
