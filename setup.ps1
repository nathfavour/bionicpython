# Check if a command exists
function Test-CommandExists {
    param (
        [string]$Command
    )
    $exists = $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
    return $exists
}

# Install Python on Windows
function Install-PythonWindows {
    Write-Host "Attempting to install Python 3.11..."
    # Python installation on Windows should be done manually or through an installer
    Write-Host "Please install Python 3.11 manually from the official website."
    exit
}

# 1. Check if Python is installed
if (-not (Test-CommandExists "python") -and -not (Test-CommandExists "python3")) {
    Write-Host "Python is not installed. Attempting to install..."
    Install-PythonWindows
    # Recheck if Python is installed
    if (-not (Test-CommandExists "python") -and -not (Test-CommandExists "python3")) {
        Write-Host "Python installation failed. Please install Python manually."
        exit
    }
} else {
    Write-Host "Python is already installed."
}

# 2. Check if Flutter is installed
if (-not (Test-CommandExists "flutter")) {
    Write-Host "Warning: If you want to build the GUI, you might need Flutter (optionally)."
}

# 3. Install requirements using pip
try {
    pip install -r requirements.txt -ErrorAction Stop
} catch {
    try {
        pip3 install -r requirements.txt -ErrorAction Stop
    } catch {
        Write-Host "Failed to install requirements with pip and pip3. Attempting to install pip..."
        python -m ensurepip
        if ($LASTEXITCODE -ne 0) {
            python3 -m ensurepip
        }
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Failed to install pip. Please reinstall Python manually."
            exit
        }
        pip install -r requirements.txt
    }
}

# 4. Download spacy model
try {
    python -m spacy download en_core_web_sm -ErrorAction Stop
} catch {
    python3 -m spacy download en_core_web_sm
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to download spacy model. Please check your Python installation."
        exit
    }
}

# 5. Inform the user about the next steps
Write-Host "To use the CLI, run the following command from the current directory:"
Write-Host "python bionicpython/bionicpython.py '<path to your pdf/docx file>'"
Write-Host "Remember to insert the path in quotes if it isn't already."