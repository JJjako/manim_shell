{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
  pkgs.python311
  pkgs.python311Packages.pip
  pkgs.python311Packages.virtualenv
  pkgs.git
  pkgs.ffmpeg
  pkgs.sox
  pkgs.pkg-config
  pkgs.cairo
  pkgs.pango
   ];


  shellHook = ''
    # Create venv if it doesn't exist
    if [ ! -d ".venv" ]; then
      python -m venv .venv
    fi

    # Activate the venv
    source .venv/bin/activate

    # Upgrade pip
    pip install --upgrade pip

    # Install Manim + Manim Slides if not already installed
    pip install --upgrade manim manim-slides
  '';
}
