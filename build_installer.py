import PyInstaller.__main__
import os
import sys

def build_installer():
    # Configurações do PyInstaller
    PyInstaller.__main__.run([
        'time_sync.py',
        '--onefile',
        '--noconsole',
        '--name=TimeSync',
        '--icon=icon.ico',  # Você precisará adicionar um ícone
        '--add-data=README.md;.',
        '--hidden-import=win32api',
        '--hidden-import=win32timezone',
        '--hidden-import=schedule',
    ])

if __name__ == "__main__":
    build_installer() 