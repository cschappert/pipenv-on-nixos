with import <nixpkgs> {};
with pkgs.python36Packages;

stdenv.mkDerivation {
  name = "Python36WithPipenv";
  buildInputs = [

    # Install Python 3.6 and it's pip package from nixpkgs.
    # Python36Packages.pip and pipenv-2018.7.1 (current in nixpkgs) 
    # are incompatible so we install pipenv into the user dir with pip
    # and modify PATH, PYTHONPATH in the shellHook.  
    
    python36Full
    python36Packages.pip

    # The following packages are related to the dependencies of your python
    # project. (C libs to compile against, etc.)

    stdenv
    zlib

  ];

  src = null;

  shellHook = ''
 
    # set SOURCE_DATE_EPOCH so that we can use python wheels
    SOURCE_DATE_EPOCH=$(date +%s)

    PATH=$HOME/.local/bin:$PATH
    PYTHONPATH=$HOME/.local/lib/python3.6/site-packages:$PYTHONPATH
    pip install --user pipenv
    pipenv install

  '';
}
