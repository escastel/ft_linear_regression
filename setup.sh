#!/bin/bash

function install(){
	echo "🔧 Creating virtual environment ..."
	python3 -m venv venv
	if [ $? -ne 0 ]; then
		echo "❌ Error: Make sure you have Python 3 installed and in your PATH."
		exit 1
	fi
	echo "✅ Virtual environment created."

	echo ""
	echo "📦 Installing dependencies ..."

	source venv/bin/activate

	if [ ! -f requirements.txt ]; then
    	echo "pandas" > requirements.txt
    	echo "matplotlib" >> requirements.txt
    	echo "📄 requirements.txt created with basic dependencies."
  	fi

	pip install --upgrade pip
	pip install -r requirements.txt

	echo ""
	echo "✅ Dependencies installed."
	echo "🐍 You are inside the Python virtual environment."
}

function clean() {
	echo "🧹 Cleaning up virtual environment and related files ..."
	deactivate
	rm -rf ./venv __pycache__/
	echo "✅ Cleaning completed."
}

function help(){
	echo "Use: ./setup.sh [comando]"
	echo ""
	echo "Available commands:"
	echo "  install   → Create virtual environment and install dependencies."
	echo "  clean     → Delete virtual environment and generated files."
}

case "$1" in
	install)
		install
	;;
	clean)
		clean
	;;
	*)
		help
	;;
esac