from setuptools import setup, find_packages

setup(
    name='Your-Package-Name',
    version='0.1',
    packages=find_packages(),
    description='convert your pdfs and docx to bionic reading format.',
    author='Nathaniel',
    # author_email='your.email@example.com',
    url='https://github.com/nathfavour/bionicpython',
    install_requires=[
        'pdf2docx',
        'python-docx',
        'spacy',
    ],
)