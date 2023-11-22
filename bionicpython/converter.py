# from pdf2docx import Converter

# pdf_file = '/Users/xcode/Downloads/maths.pdf'
# docx_file = '/Users/xcode/Downloads/maths.docx'

# # convert pdf to docx
# cv = Converter(pdf_file)
# cv.convert(docx_file)      # all pages by default
# cv.close()

import argparse
from pdf2docx import Converter

parser = argparse.ArgumentParser(description='Convert PDF to DOCX')
parser.add_argument('--pdf', help='Path to the PDF file', required=True)
parser.add_argument('--docx', help='Path to the output DOCX file', required=True)

args = parser.parse_args()

pdf_file = args.pdf
docx_file = args.docx

# convert pdf to docx
cv = Converter(pdf_file)
cv.convert(docx_file)      # all pages by default
cv.close()