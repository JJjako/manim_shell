{ pkgs ? import <nixpkgs> {} }:

let
  python = pkgs.python311;

  manimEnv = pkgs.python311.withPackages (ps: with ps; [
    numpy
    manim
    manim-slides
  ]);
in

pkgs.mkShell {
  buildInputs = [
    manimEnv
    pkgs.gcc.libcxx
    pkgs.pkg-config
    pkgs.cairo
    pkgs.pango
    pkgs.ffmpeg
  ];

  shellHook = ''
    echo "Welcome to the Manim environment!"
    echo "Python: $(python --version)"
    echo "Numpy: $(python -c 'import numpy; print(numpy.__version__)')"
    echo "Manim: $(python -c 'import manim; print(manim.__version__)')"
    echo "Manim Slides: $(python -c 'import manim_slides; print(manim_slides.__version__)')"
  '';
}
