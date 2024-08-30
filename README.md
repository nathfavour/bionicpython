convert your pdfs and docx to bionic reading format.

## normal format

![1700793569388](image/README/1700793569388.png)

## bionic format

![1700793580179](image/README/1700793580179.png)

## USAGE

1. clone this repository
2. install the required packages using the following command
   ```bash
   pip install -r requirements.txt
   ```
3. run the following command to convert your pdf/docx to bionic format
   ```bash
   python bionicpython/bionicpython.py <path to your pdf/docx file>
   ```
4. bionic python will create a new bionified docx file in the same directory, which you can then comvert to pdf if you wish

N.B: I am constantly working to make this better, and your suggestions are invaluable! Please feel free to open an issue or a pull request.

## TO-DO

- [X] add usage guide in README.md
- [ ] create pip package
- [ ] add other ebook formats like epub, etc
- [ ] optimise code/ reduce processing time
- [ ] create gui application



## EDIT

1. You can optionally run 'setup.sh' if you're on MacOs or linux.
2. If you're on windows, you can also run 'setup.ps1'
3. The aim of these setup scripts is to ease the complexity of setting up bionicpython.