#!/bin/bash

# Function to check if command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to install Python on macOS
install_python_macos() {
  echo "Installing Python 3.11 using Homebrew..."
  brew install python@3.11
}

# Function to install Python on Linux
install_python_linux() {
  echo "Installing Python 3.11 using apt..."
  sudo apt update
  sudo apt install python3.11 -y
}

# 1. Check if Python is installed
if ! command_exists python && ! command_exists python3; then
  echo "Python is not installed. Attempting to install..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    install_python_macos
  else
    install_python_linux
  fi
  # Open a new terminal to check if installation was successful
  if ! command_exists python && ! command_exists python3; then
    echo "Python installation failed. Please install Python manually."
    exit 1
  fi
else
  echo "Python is already installed."
fi

# 2. Check if Flutter is installed
if ! command_exists flutter; then
  echo "Warning: If you want to build the GUI, you might need Flutter (optionally)."
fi

# 3. Install requirements using pip
open_new_terminal_and_run() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    osascript -e 'tell app "Terminal" to do script "'"$1"'"'
  else
    x-terminal-emulator -e $1
  fi
}

open_new_terminal_and_run "
if ! pip install -r requirements.txt && ! pip3 install -r requirements.txt; then
  if ! command_exists pip; then
    python -m ensurepip || python3 -m ensurepip
  fi
  if ! pip install -r requirements.txt && ! pip3 install -r requirements.txt; then
    echo 'Failed to install requirements. Please reinstall Python manually.'
    exit 1
  fi
fi
"

# 4. Download spacy model
if ! python -m spacy download en_core_web_sm && ! python3 -m spacy download en_core_web_sm; then
  echo "Failed to download spacy model. Please check your Python installation."
  exit 1
fi

# 5. Inform the user about the next steps
echo "To use the CLI, run the following command from the current directory:"
echo "python bionicpython/bionicpython.py '<path to your pdf/docx file>'"
echo "Remember to insert the path in quotes if it isn't already."